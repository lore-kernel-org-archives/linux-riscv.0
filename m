Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5287CEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 12:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XdaoABGpD1WwiwoOFgDYYUBI2TOLMzKN5dgAQyg/BhM=; b=EjX9tqklnu8kKH
	Tkjn7Fy+AIvBWnHdFtUqnhy6ZL3+SYRcbBX0wI0y1+fhs0rdwAcndJM5Um7fQXX0xZG3Zi+p8pfbt
	x7e2rPp72TG1O/HGnH9CrCFGdlhJUncASZRekLR1NAgI+qPckZPwiMCmmQdwbAfrsByAhd/zKOMXi
	LTA0Yo87E2nXUHkDuZe/52NwOG6Ni5r2r7RBc7dg32mfgXM6M5Vr8/SxbLIPnWE1LFEPeHEjA2806
	8HS9mJRuk+HQxugnaBnnwrhOM0vlmzz8LrnX1ZM0mZ1MLmxa8Jp5mzgqp6Zn7JKKJPpUJmiCcw20a
	r9fnVq1jpj6CDr6onELA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH1Sr-00FrNf-0C;
	Wed, 05 Jul 2023 12:18:33 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH1Sn-00FrMM-1Z;
	Wed, 05 Jul 2023 12:18:31 +0000
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id B47EFC000A;
	Wed,  5 Jul 2023 12:18:22 +0000 (UTC)
Message-ID: <994ae720-b3a1-1e67-ca9c-ca00e6525488@ghiti.fr>
Date: Wed, 5 Jul 2023 14:18:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] RISC-V: KVM: provide UAPI for host SATP mode
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Cc: anup@brainfault.org, atishp@atishpatra.org, ajones@ventanamicro.com
References: <20230705091535.237765-1-dbarboza@ventanamicro.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230705091535.237765-1-dbarboza@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_051829_831374_CBCA1ECF 
X-CRM114-Status: GOOD (  22.77  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 05/07/2023 11:15, Daniel Henrique Barboza wrote:
> KVM userspaces need to be aware of the host SATP to allow them to
> advertise it back to the guest OS.
>
> Since this information is used to build the guest FDT we can't wait for


The thing is the "mmu-type" property in the FDT is never used: the 
kernel will probe the hardware and choose the largest available mode, or 
use "no4lvl"/"no5lvl" from the command line to restrict this mode. And 
FYI the current mode is exposed through cpuinfo. @Conor Can we deprecate 
this node or something similar?

Just a remark, not sure that helps :)


> the SATP reg to be readable. We just need to read the SATP mode, thus
> we can use the existing 'satp_mode' global that represents the SATP reg
> with MODE set and both ASID and PPN cleared. E.g. for a 32 bit host
> running with sv32 satp_mode is 0x80000000, for a 64 bit host running
> sv57 satp_mode is 0xa000000000000000, and so on.
>
> Add a new userspace virtual config register 'satp_mode' to allow
> userspace to read the current SATP mode the host is using with
> GET_ONE_REG API before spinning the vcpu.
>
> 'satp_mode' can't be changed via KVM, so SET_ONE_REG is allowed as long
> as userspace writes the existing 'satp_mode'.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   arch/riscv/include/asm/csr.h      | 2 ++
>   arch/riscv/include/uapi/asm/kvm.h | 1 +
>   arch/riscv/kvm/vcpu.c             | 7 +++++++
>   3 files changed, 10 insertions(+)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index b6acb7ed115f..be6e5c305e5b 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -46,6 +46,7 @@
>   #ifndef CONFIG_64BIT
>   #define SATP_PPN	_AC(0x003FFFFF, UL)
>   #define SATP_MODE_32	_AC(0x80000000, UL)
> +#define SATP_MODE_SHIFT	31
>   #define SATP_ASID_BITS	9
>   #define SATP_ASID_SHIFT	22
>   #define SATP_ASID_MASK	_AC(0x1FF, UL)
> @@ -54,6 +55,7 @@
>   #define SATP_MODE_39	_AC(0x8000000000000000, UL)
>   #define SATP_MODE_48	_AC(0x9000000000000000, UL)
>   #define SATP_MODE_57	_AC(0xa000000000000000, UL)
> +#define SATP_MODE_SHIFT	60
>   #define SATP_ASID_BITS	16
>   #define SATP_ASID_SHIFT	44
>   #define SATP_ASID_MASK	_AC(0xFFFF, UL)
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index f92790c9481a..0493c078e64e 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -54,6 +54,7 @@ struct kvm_riscv_config {
>   	unsigned long marchid;
>   	unsigned long mimpid;
>   	unsigned long zicboz_block_size;
> +	unsigned long satp_mode;
>   };
>   
>   /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 8bd9f2a8a0b9..b31acf923802 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -313,6 +313,9 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
>   	case KVM_REG_RISCV_CONFIG_REG(mimpid):
>   		reg_val = vcpu->arch.mimpid;
>   		break;
> +	case KVM_REG_RISCV_CONFIG_REG(satp_mode):
> +		reg_val = satp_mode >> SATP_MODE_SHIFT;
> +		break;
>   	default:
>   		return -EINVAL;
>   	}
> @@ -395,6 +398,10 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>   		else
>   			return -EBUSY;
>   		break;
> +	case KVM_REG_RISCV_CONFIG_REG(satp_mode):
> +		if (reg_val != (satp_mode >> SATP_MODE_SHIFT))
> +			return -EINVAL;
> +		break;
>   	default:
>   		return -EINVAL;
>   	}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
