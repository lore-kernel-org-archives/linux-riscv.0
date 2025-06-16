Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAED9C71136
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 18:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xjs4PfZz1NyXkCHs60RRv/hTuervd9iIiEhPI7tHvQo=; b=rn5FXmOmJuVDIK
	zxup3C4ZziGfBkAFTt1j/9lK5z0tbcZOiUw1Vis2FsLJw8+OUHA3IUDkQG+t6vWuKZkIeg4Q6phVi
	ThfUKtQTGiJMrTEXT+Td2W18d3qBtyV8Skyp+yNEAgv7bPGvRdcQzoeTdRL0Oq7pM9drrg8X+fuqL
	PyBDJkE012NpCJYfsLS0S0b5SGBhE/hk//WHOuGZ2Zy0djUm2Dlh0F40o59grHsBuAIZ130ywI47E
	9eqcjKd5n8YztJyX+X2Kpvbcy07oU4GXr0qOiRhFaaiOCY3U2HevzeifY+n/lFCXT2QCaqsOInLW0
	Cg/aJzQ035IwF9mbbyJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREoR-00000005Hjc-0hGe;
	Mon, 16 Jun 2025 18:44:07 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREoO-00000005HjD-2GL1
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 18:44:05 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5535e35b059so6039577e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 11:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750099442; x=1750704242; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c1qLN7T4HJJ+Y5LI/oNrcpp9DbSjlU6S/RVNFX71VBg=;
        b=Br/so5F/pyoOZayOrp2UJtC8OYKU3aCVsYWawcPw6BwScOz+IHenRv4kQSIPSt/JYR
         PV9DvPmt93yHlPZm2NTNOQTK61V3N69XC6Es/E3ipE3ACNk34LYdkO7uQeasbyGynCMi
         p4IG1jNMzpRYFehb6zGFPXEgf3vF4fThE6T7wwXvdMAiOZ9ogS9W2pDY7nYLgOiAoXSJ
         JVeqdhwYyLIt2uzugnJdhmuA0kH348NBd8cohMMBzyebSwd4f5BiymatApwtFdsvjrL3
         5S3rlWqPMzlXIe2ouWttXlOLnYGe+JB5W6RPi8xpnhv0SFhMrydxj6+mLfz6ueakSO7E
         Zyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750099442; x=1750704242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1qLN7T4HJJ+Y5LI/oNrcpp9DbSjlU6S/RVNFX71VBg=;
        b=IyA9431Ds7dwI+Yr+vPgaLkLJeCSaO/voHMtyt0n6mJk1jIynzRj3KPdqn22IJAea3
         uRRZIRp5R3ZvLoFpI0ZEgXCp3ToS+APray0M/SP+WgYc5FWvzxG2q6AsmfOyimvqFd8J
         8lfMBZVueeapy9f+C+8aH1QiyDCFz3AB2jZ+4RPqFtSovmaCUldZKthLP0vmOiVsnmnT
         +65Ol7Y/bh6iMwR1b8+Dv6m4K6Y3ixK/EBVioFJLUhJ5EmDSSUeMNuKtIWORAx1NaAJl
         uQTNnqZ+iTlaedU9clGbkX/a5JIlCxEZHWS6/YBucE9TkojguQWFBvVdkPbLahsoVQDl
         yVCw==
X-Forwarded-Encrypted: i=1; AJvYcCWT6kM3uC6eTyAttUP4ySxZSChRJ6JSEFHNlsvNuqbtraihqCZ3FtAGv5n7/K91uMsFhK1+LThQJvSzdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwGkyW+16qC0OSq3wgIcjpLHw9Z5ivltWs+38V7Smw1Wk2chag
	N+1HaBVmbE85KYKiQObk7uU01WBjuTF8OD8vzog/rIv2I3AVUrBPL4q4
X-Gm-Gg: ASbGncvEQicRu7MBdkKt9wg9/rKZwgL4iQ/HdxkBd8BWusbxt6Px7Of9vNwvecP2V+o
	S6s0jXXX4ApdLM9kr7sL7SlBfkS+6h18eEnL1R7z3VlTCij8DVkukm/cKLta+zgQlvPsy0xEArK
	zinkm4VfXYgp0eojK2ndf0HzCelBnkaUG7p0gf6v/nBMBYr4lpE7Jga6eTyITIasY3Vm/5n/5n7
	nTm02jEIWDiV4/oyVl2FuizcMhYZ2TWSnVi4eZtf4LnE253FvcQ99VdziQcivB0CvQcMEp6jTXE
	1DMcj2S3bxeXfz39kIVW/BGG95pvYj080AWR9G19ajB5Gffd+qtvLuHJV+NgervUe3dtHq3z0k1
	Nww==
X-Google-Smtp-Source: AGHT+IFym3ZWTKD87/DdAM+usukWodq2LIzMiT0j5EKO0t5vLXxpbSACWoxnRHmuff9KOJlv5S/f3Q==
X-Received: by 2002:a05:6512:3196:b0:553:9d73:cb15 with SMTP id 2adb3069b0e04-553b54d984amr3390818e87.15.1750099441993;
        Mon, 16 Jun 2025 11:44:01 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-553ac1367e9sm1632899e87.79.2025.06.16.11.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 11:44:01 -0700 (PDT)
Date: Mon, 16 Jun 2025 20:44:01 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, 
	conor.dooley@microchip.com, conor+dt@kernel.org, jassisinghbrar@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 0/4] Add Microchip IPC mailbox
Message-ID: <gcn3ot6angrjpmk5nu7gwcuqqrdecuxgisysmgkp4mof3egzot@dvruxuw6w5kp>
References: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_114404_587375_B0B85F65 
X-CRM114-Status: GOOD (  31.18  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On 2024-12-17 11:31:30 +0000, Valentina Fernandez wrote:
> Hello all,
> 
> This series adds support for the Microchip Inter-Processor Communication
> (IPC) mailbox driver.
> 
> Microchip's family of RISC-V SoCs typically has one or more clusters
> that can be configured to run in Asymmetric Multi-Processing (AMP) mode.
> 
> The Microchip IPC is used to send messages between processors using
> an interrupt signaling mechanism. The driver uses the RISC-V Supervisor
> Binary Interface (SBI) to communicate with software running in machine
> mode (M-mode) to access the IPC hardware block.
> 
> Additional details on the Microchip vendor extension and the IPC
> function IDs described in the driver can be found in the following
> documentation:
> 
> https://github.com/linux4microchip/microchip-sbi-ecall-extension
> 
> The PIC64GX MPU has a Mi-V IHC block, this will be added to the PIC64GX
> dts after the initial upstreaming [1].
> 
> [1] https://patchwork.kernel.org/project/linux-riscv/patch/20240725121609.13101-18-pierre-henry.moussay@microchip.com/
> 
> Changes in v6:
> - update bindings to explain why 'reg' is not needed with microchip,sbi-ipc compatible
> 
> Changes in v5:
> - change interrup-names property to use a list instead of pattern
> - move assitionalProperties after allOf : block
> - update reg property in dt binding example to use lowercase hex
> 
> Changes in v4:
> - specify that microchip,miv-ihc-rtl-v2 is intended for use with MIV IHC Soft IP
> - drop items array and use const value for compatible strings
> - add a contraint to microchip,ihc-chan-disabled-mask property
> - minor improvements to "'#mbox-cells' description
> 
> Changes in v3:
> - Fix incorrent formatting around '=' in dt binding examples
> - Add per compatible descriptions in dt binding
> - Add '>' in certain dt binding descriptions to keep paragraphs maintained
> - export __cpuid_to_hartid_map to compile mailbox driver as module
> - Drop unused enum ipc_irq_type
> - rename struct mchp_ipc_probe to mchp_ipc_mbox_info
> - rename struct ipc_chan_info to mchp_ipc_sbi_chan
> - rename struct microchip_ipc to mchp_ipc_sbi_mbox
> - use phys_addr_t for __pa()
> - drop mchp_ipc_get_chan_id function
> - use num_chans in mbox_controller
> - Fix buf_base_tx and buf_base_rx sizes using max and kmalloc
> 
> Changes in v2:
> - use kmalloc and __pa() instead of DMA API
> - fix size of buf_base to avoid potential buffer overflow
> - add kernel doc for exported functions (mchp_ipc_get_chan_id)
> - use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL
> - drop unnecessary blank line and fix alignment issues
> - drop of_match_ptr
> - move MODULE_DEVICE_TABLE next to the definition
> - reword subject from riscv: asm: vendorid_list to riscv: sbi: vendorid_list
> - remove the word "driver" from dt-binding commit subject
> - make interrupt-names a required property for all cases
> - add dependency on COMPILE_TEST and ARCH_MICROCHIP
> 
> Regards,
> Valentina
> 
> Valentina Fernandez (4):
>   riscv: sbi: vendorid_list: Add Microchip Technology to the vendor list
>   riscv: export __cpuid_to_hartid_map
>   dt-bindings: mailbox: add binding for Microchip IPC mailbox controller
>   mailbox: add Microchip IPC support
> 
>  .../bindings/mailbox/microchip,sbi-ipc.yaml   | 123 +++++
>  arch/riscv/include/asm/vendorid_list.h        |   1 +
>  arch/riscv/kernel/smp.c                       |   1 +
>  drivers/mailbox/Kconfig                       |  13 +
>  drivers/mailbox/Makefile                      |   2 +
>  drivers/mailbox/mailbox-mchp-ipc-sbi.c        | 504 ++++++++++++++++++
>  include/linux/mailbox/mchp-ipc.h              |  33 ++
>  7 files changed, 677 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
>  create mode 100644 drivers/mailbox/mailbox-mchp-ipc-sbi.c
>  create mode 100644 include/linux/mailbox/mchp-ipc.h
> 
> -- 
> 2.34.1
> 

Building this driver as a module with SMP=n fails becuase the non-SMP
cpuid_to_hartid_map() depends on the non-exported boot_cpu_hartid
(discovered via randconfig).

From the description of the driver it doesn't seem to be very useful
with SMP=n, would it make sense to have it depend on SMP rather than
exporting boot_cpu_hartid?

Regards,
Klara Modin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
