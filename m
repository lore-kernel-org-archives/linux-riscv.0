Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D72AC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 09:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTlkNuUFPVAumFAJWaPlPncekaDg/9VLidUpDvzQWCo=; b=dxFjHUU0gUIPqN
	RbrfTobgpav6c6pJ/tkKfHSeRdRzTGQRYQqcM1qFxvECotMjxULOtBacpDgNrYR2LXmeBfFuFwvU+
	voKjrfRvQYA5Y60HusbrRIUkHEeTPRGOvr3WsZ5m4JYco5LmEkKgnvOVRr1w46dKyvfRUI/+JSnrO
	jKjwvM9D3ycmYbidQAVqxSxk4gLFJIUbrhWZUzbe9utrYoEJvJW9wq9t55NPC/XViX/Fu5AIDrbke
	2EgxZTLeTSZyPaHtjAlV7zqz1UfDHm+sksOIiajhkSYR23qwkDH1NxnaHJL9JBRX56I5xcOAB69A5
	BwOzXGHb4XjRkSrvZmwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAR4L-00000008WKj-3LfM;
	Fri, 24 May 2024 09:18:33 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAR4G-00000008WFU-0tAK;
	Fri, 24 May 2024 09:18:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8037A40004;
	Fri, 24 May 2024 09:18:20 +0000 (UTC)
Message-ID: <b96e25d7-c8ec-44bd-baf9-c5166389f10e@ghiti.fr>
Date: Fri, 24 May 2024 11:18:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Add Svadu Extension Support
Content-Language: en-US
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, tjytimi@163.com,
 conor.dooley@microchip.com, ajones@ventanamicro.com,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20231102120129.11261-1-yongxuan.wang@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20231102120129.11261-1-yongxuan.wang@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_021828_475289_4B42909E 
X-CRM114-Status: GOOD (  12.18  )
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

Hi Yong-Xuan,

On 02/11/2023 13:01, Yong-Xuan Wang wrote:
> Svadu is a RISC-V extension for hardware updating of PTE A/D bits. This
> patch set adds support to enable Svadu extension for both host and guest
> OS.
>
> ---
> v3:
> - fix the control bit name to ADUE in PATCH1 and PATCH3
> - update get-reg-list in PATCH4
>
> v2:
> - add Co-developed-by: in PATCH1
> - use riscv_has_extension_unlikely() to runtime patch the branch in PATCH1
> - update dt-binding
>
> Yong-Xuan Wang (4):
>    RISC-V: Detect and Enable Svadu Extension Support
>    dt-bindings: riscv: Add Svadu Entry
>    RISC-V: KVM: Add Svadu Extension Support for Guest/VM
>    KVM: riscv: selftests: Add Svadu Extension to get-reg-list testt
>
>   .../devicetree/bindings/riscv/extensions.yaml  |  6 ++++++
>   arch/riscv/include/asm/csr.h                   |  1 +
>   arch/riscv/include/asm/hwcap.h                 |  1 +
>   arch/riscv/include/asm/pgtable.h               |  6 ++++++
>   arch/riscv/include/uapi/asm/kvm.h              |  1 +
>   arch/riscv/kernel/cpufeature.c                 |  1 +
>   arch/riscv/kvm/vcpu.c                          |  3 +++
>   arch/riscv/kvm/vcpu_onereg.c                   |  1 +
>   .../testing/selftests/kvm/riscv/get-reg-list.c | 18 ++++++++++++++++++
>   9 files changed, 38 insertions(+)
>

Will you spin a new version for this?

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
