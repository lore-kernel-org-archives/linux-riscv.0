From: michaeljclark@mac.com (Michael Clark)
Date: Tue, 13 Nov 2018 14:22:42 +1300
Subject: [sw-dev] SBI extension proposal v2
In-Reply-To: <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
 <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
Message-ID: <36B37F85-C952-4D2E-912C-B2BDA34430DA@mac.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org



>> On 11/11/2018, at 6:47 AM, Luke Kenneth Casson Leighton <lkcl@lkcl.net> wrote:
>> 
>> On Sat, Nov 10, 2018 at 5:42 PM Olof Johansson <olof@lixom.net> wrote:
>> 
>> The case of console is in this case pretty simple: It's intended for
>> early boot for very simplistic environments (before the rest of the
>> kernel is up, etc). Keeping the SBI console around beyond early boot,
>> and somehow trying to optimize for it for those use cases is a
>> misdirected effort; that's what native drivers are for.
> 
> spike (which is only around 7,000 lines of code) doesn't have native
> drivers, and qemu is too heavy-duty to consider adding custom
> extensions and experimental research onto.

Neither of those statements are completely true. Spike can have its hardware emulation capabilities expanded and QEMU is not unsuitable for experimental research. For example, we have been developing the CLIC interrupt controller model in QEMU.

We also could port VirtIO from RISCVEMU to spike. It would be nice to add the PLIC, CLIC and an NS16550A UART to spike so we can model the RISC-V ?virt? machine that is currently in QEMU.

That said, you are probably correct. A simulator like spike makes a little more sense for evolving the hardware models versus a heavy-weight fast-model emulator like QEMU.

> with nothing in spike *other* than the serial console, it's the only
> way in and out.

That?s likely to change.

There is bare metal code in BBL to support several console types (HTIF, SiFive UART, NS16550A). All of these except for HTIF have kernel device drivers. The main reason for the SBI console is to be used as a bring-up console before full device drivers have been developed and for simulation use-cases (running Linux in spike and HDL simulators).

Spike currently relies on HTIF for console and HTIF is not appropriate as a kernel device interface. HTIF is designed for tethered simulation as it relies on a front-end finding special ELF symbols used for host <-> target communications.

A polled-mode console interface is fine for debug but not appropriate for running something like pppd. Adding a tty layer (sbi_ioctl) to SBI is not a good idea. Note: an actual serial interface has several out-of-band interface to check link status and set baud rates, etc (as do the simple SBI drivers which have these details hardcoded). It?s a simple boot console.

Apologies Luke, this is not directed at you, rather it is directed at SBI.

I think we should seriously question any interface we add to SBI.

- Making SBI a library API is an invitation for binary blobs. It should remain an ECALL interface to fill in privilege boundary virtualization gaps i.e. functions that require M-mode privileges. It can?t or shouldn?t do this if it is linked to the kernel as a library. In the case it were a library the question is why not just document the hardware interface and add a driver to the kernel. For anything else, such as for virtualization; we should minimize address space footprint for anything that is not a device. Otherwise we should spend effort on defining standard hardware interfaces such as virtualizable interrupt controllers or PMUs.

- SBI shouldn?t be used as a wrapper to hide (as yet unspecified) hardware interfaces from the kernel. i.e. for example to hide a device aperture that contains configuration for both M-mode and S-mode interrupts or an interface for a function that we don?t yet have hardware for. It?s equally possible that we can make bad software interfaces.

There are some points up for discussion regards HALs.

There is a principle that functions that have typically been done in hardware can be simplified if certain aspects are devolved to software. This is valid.

We have this with S-mode timer and software interrupts which presently are delegated by the monitor who implements the SBI interface to configure or initiate them. This is not strictly because we don?t want to expose the hardware to Linux i.e. why not just write a driver in Linux? SBI is required here because these functions were initially only able to be executed in M-mode and it would violate a privilege boundary for Linux to run their code as Linux is a Supervisor. i.e. there was no direct interface for S-mode to configure or initiate software or timer interrupts.

I think the best approach is for folk to share their hardware interfaces and explore approaches that allow S-mode to operate autonomously whether M-mode exists or not. I.e. some models may require M-mode, and some models may support fully autonomous S-mode (the only M-mode function that exists is running on another core). e.g. Real-time.

Of course virtualization and real-time can be combined if the M-mode core can control interrupt routing tables on behalf of the running Supervisors. We could have multiple RTOS running with Supervisors that have pre-emptable User tasks and the virtual domains never need to enter M-mode, except perhaps for power on and power off. Maybe power management is in scope. One should probably chat to Linus about what he?d like to see... possibly not an in-kernel byte-code interpreter...


BTW Please do not swear on the list. Alex, Bruce, myself and the other posters have not written anything that warrants swearing at us. Many folk have been working away quietly in the open and the messages to the contrary are completely unfounded. Anyway this goes without saying. There is only one person swearing and shouting on this list.

Luke, you are incorrigible. Whether you are a bully or not is neither here nor there. Your behaviour on this mailing list is not acceptable. Try no shouting or swearing. Many have advised this before but there has been no change.
