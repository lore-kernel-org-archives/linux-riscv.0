From: arnd@arndb.de (Arnd Bergmann)
Date: Tue, 7 Aug 2018 22:15:36 +0200
Subject: [PATCH 1/2] pcie-microsemi: Add support for the Vera-board root
 complex
In-Reply-To: <CY4PR11MB1832A0C69637C6208A88C7B396270@CY4PR11MB1832.namprd11.prod.outlook.com>
References: <CY4PR11MB1832A0C69637C6208A88C7B396270@CY4PR11MB1832.namprd11.prod.outlook.com>
Message-ID: <CAK8P3a1CoLpw3aTY_UeF3mfzMvtedRsoMVEV-=WkMXue1ycTHw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Aug 7, 2018 at 8:18 PM <Daire.McNamara@microchip.com> wrote:
> +
> +/* PCIe operations */
> +static struct pci_ops microsemi_pcie_ops = {
> +        .map_bus = microsemi_pcie_map_bus,
> +        .read        = pci_generic_config_read,
> +        .write        = pci_generic_config_write,
> +};

Could you use pci_generic_ecam_ops here?

> +        /* Setup MSI */
> +        if (IS_ENABLED(CONFIG_PCI_MSI)) {
> +                port->msi_domain = irq_domain_add_linear(node,
> +                                                MICROSEMI_NUM_MSI_IRQS,
> +                                                &msi_domain_ops,
> +                                                &microsemi_pcie_msi_chip);
> +                if (!port->msi_domain) {
> +                        dev_err(dev, "Failed to get a MSI IRQ domain\n");
> +                        return -ENODEV;
> +                }
> +                microsemi_pcie_enable_msi(port);
> +        }
> +
> +        /* Enable interrupts */
> +        writel(MICROSEMI_PCIE_ENABLE_MSI | MICROSEMI_PCIE_LOCAL_INT_ENABLE,
> +                bridge_base_addr + MICROSEMI_IMASK_LOCAL);
> +
> +        return 0;
> +}

It looks like you unconditionally use the MSI controller integrated into
the host brige. Since this is routed through a legacy interrupt, it would
result in rather poor performance. It would be better to write the driver
and binding in a way that allows the use of the CPU's real MSI
controller if at all possible, and only fall back to the integrated one
if that doesn't work.

> +        err = pci_scan_root_bus_bridge(bridge);
> +        dev_info(dev, "pci_scan_root_bus_bridge done\n");
> +        if (err < 0)
> +                goto error;
> +
> +        bus = bridge->bus;
> +
> +        pci_assign_unassigned_bus_resources(bus);
> +        list_for_each_entry(child, &bus->children, node)
> +                pcie_bus_configure_settings(child);
> +        pci_bus_add_devices(bus);

I think all this should be replaced with pci_probe_bus().

Overall, my feeling is that the PCIe portion of this driver could just be
handled by either the generic OF PCI driver or a simple stub that
calls pci_host_common_probe(). While the MSI controller driver could
be split out into a separate file in drivers/irqchip.

       Arnd
