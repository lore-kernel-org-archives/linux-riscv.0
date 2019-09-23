Return-Path: <SRS0=c0nt=XS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_ADSP_ALL,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B79C3A5A6
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 23 Sep 2019 06:54:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD69E2087C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 23 Sep 2019 06:54:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uT1MDydb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="J7ZO202n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD69E2087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3HpezBvh3oAhLQFh/vswJcvCSzlfKz4oH5PkfkWMZo8=; b=uT1MDydbb/+jbT/ScgosyUHM8
	QaBMdn3vBtSxyfdU06bvwWyY/ZpEud1HGMYg4ipNGReIUXMbg0oiKWrRYnhJqw+7L4CEkWze/eOzF
	AoPEYakhh6EubA8tg1nJLnr/dh+9xUdD20ARySXR5lGidLQmy44B8ofoTER62IyRMFpctlCOdgkMz
	+3JqwxJ+1+uK4FzVjDcWOCaKRpURsPmFnE7quSlr/Gzys8myg3+2FnojgCzvnZyIHYm4aVxCb0Zi+
	67TLDP2THgx/gPpod537BGF0b6ArmB/DIYBIhSv7YuY1b4VPSHgobcnijJCH20szCopqLbLiKL1HV
	6Suf7fTIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCIEt-0003am-2V; Mon, 23 Sep 2019 06:54:27 +0000
Received: from smtp-fw-2101.amazon.com ([72.21.196.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCIEp-0003Zg-I3
 for linux-riscv@lists.infradead.org; Mon, 23 Sep 2019 06:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569221663; x=1600757663;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=0LuES5jNYjOJrVNcd7E+YqVsn5M9qjRy0UqX6zqVjPQ=;
 b=J7ZO202nnsCuiqYAj6lgh4rcCNKcSpFPBtVskgGv07wkuyGKhx7osQph
 NWbuX2CqcioeUj641kCNrV3i3ADWAk4lJdnUfc8ObYbBdfTuuArYvo/vg
 rY6a5kDONGUBgVN0Ddl7d45rZxPGSUF7wcvhbJi43sDqE1cykKB8xhDKA k=;
X-IronPort-AV: E=Sophos;i="5.64,539,1559520000"; d="scan'208";a="752438067"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 23 Sep 2019 06:54:21 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id D5DF9A0745; Mon, 23 Sep 2019 06:54:16 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 23 Sep 2019 06:54:15 +0000
Received: from 38f9d3867b82.ant.amazon.com (10.43.161.217) by
 EX13D20UWC001.ant.amazon.com (10.43.162.244) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 23 Sep 2019 06:53:58 +0000
Subject: Re: [PATCH v7 11/21] RISC-V: KVM: Handle WFI exits for VCPU
To: Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@sifive.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Radim K <rkrcmar@redhat.com>
References: <20190904161245.111924-1-anup.patel@wdc.com>
 <20190904161245.111924-13-anup.patel@wdc.com>
From: Alexander Graf <graf@amazon.com>
Message-ID: <3c149ec4-38df-9073-2880-b28148d3c059@amazon.com>
Date: Mon, 23 Sep 2019 08:53:49 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190904161245.111924-13-anup.patel@wdc.com>
Content-Language: en-US
X-Originating-IP: [10.43.161.217]
X-ClientProxiedBy: EX13D28UWC002.ant.amazon.com (10.43.162.145) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Precedence: Bulk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190922_235423_791662_B0F94DAB 
X-CRM114-Status: GOOD (  15.02  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 04.09.19 18:15, Anup Patel wrote:
> We get illegal instruction trap whenever Guest/VM executes WFI
> instruction.
> 
> This patch handles WFI trap by blocking the trapped VCPU using
> kvm_vcpu_block() API. The blocked VCPU will be automatically
> resumed whenever a VCPU interrupt is injected from user-space
> or from in-kernel IRQCHIP emulation.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   arch/riscv/kvm/vcpu_exit.c | 72 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 72 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index d75a6c35b6c7..39469f67b241 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -12,6 +12,13 @@
>   #include <linux/kvm_host.h>
>   #include <asm/csr.h>
>   
> +#define INSN_OPCODE_MASK	0x007c
> +#define INSN_OPCODE_SHIFT	2
> +#define INSN_OPCODE_SYSTEM	28
> +
> +#define INSN_MASK_WFI		0xffffff00
> +#define INSN_MATCH_WFI		0x10500000
> +
>   #define INSN_MATCH_LB		0x3
>   #define INSN_MASK_LB		0x707f
>   #define INSN_MATCH_LH		0x1003
> @@ -112,6 +119,67 @@
>   				 (s32)(((insn) >> 7) & 0x1f))
>   #define MASK_FUNCT3		0x7000
>   
> +static int truly_illegal_insn(struct kvm_vcpu *vcpu,
> +			      struct kvm_run *run,
> +			      ulong insn)
> +{
> +	/* Redirect trap to Guest VCPU */
> +	kvm_riscv_vcpu_trap_redirect(vcpu, EXC_INST_ILLEGAL, insn);
> +
> +	return 1;
> +}
> +
> +static int system_opcode_insn(struct kvm_vcpu *vcpu,
> +			      struct kvm_run *run,
> +			      ulong insn)
> +{
> +	if ((insn & INSN_MASK_WFI) == INSN_MATCH_WFI) {
> +		vcpu->stat.wfi_exit_stat++;
> +		if (!kvm_arch_vcpu_runnable(vcpu)) {
> +			srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
> +			kvm_vcpu_block(vcpu);
> +			vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +			kvm_clear_request(KVM_REQ_UNHALT, vcpu);
> +		}
> +		vcpu->arch.guest_context.sepc += INSN_LEN(insn);
> +		return 1;
> +	}
> +
> +	return truly_illegal_insn(vcpu, run, insn);
> +}
> +
> +static int illegal_inst_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
> +			      unsigned long insn)
> +{
> +	unsigned long ut_scause = 0;
> +	struct kvm_cpu_context *ct;
> +
> +	if (unlikely((insn & 3) != 3)) {

What do the low 2 bits mean here? Maybe you can use a define instead?


Alex




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
