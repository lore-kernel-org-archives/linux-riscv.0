Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E56C79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 11:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXQIrngR9Gy9652nGZRRSx7agaPbU8gLyfwgBGLufyw=; b=GV9wvD8TqPDHh3
	Vnvo9OgLv0rBK8WVmtChD7L0bD6YGILBLHTw634orq6HKeIRIfkQK60FoM2l2dRi+apn0kN5oAsDA
	VdIjG2AgcMPP08G7ROL6foA7eVmTCTjmv9lVYWAcw2CXdQqbeFM3LTdKLzgr2Dcg8LA+iVZ7qiWPx
	lf3rPH9jTCoW95d3DCDkoiFsgLj2SST5YtcWX4I0si8Saa+hrRvY908gkfv12is+/wTPmvPHvi4qp
	QYDXe8mYvLc7tYKN7bakbijZNkMa1erqNplBzDAlBNlDvpdzra1+REjDaHBsPV0Raa4BYortwTY7r
	fiR9TbBUtevpgU7npWoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cZA-0000000E8zB-2INC;
	Thu, 10 Sep 2026 11:03:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cZ8-0000000E8y1-3mss
	for linux-riscv@bombadil.infradead.org;
	Thu, 10 Sep 2026 11:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Message-ID:Date:In-Reply-To
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Hx87S2Y2VYrsz+ltlElpgYkkRP/rEKOc33NOUB4sPbE=; b=cjuVZRvTb6onf8fhqkKzPmBfRm
	V+7T52MmqmRukaq3KPFq8a1Benkh6yYRajz7f5436bpuPJ8lY6GzHRR8A1ipFCc4HU3v2P5k6cbJk
	rboIjRKpTaixgdc6jmvcF+0B65Jfa1WNNmfxlTBlYgm1RzWEa5n1eMj099id2SXF60RZUYgJGORY9
	oVCVKedUP26aK4fDl/fB6ZtxjbOojPbGhkaetsfBSHqeXTTYLwukSsCZB5z1T7Nsnb4VegbQK0Xvj
	oPSTicc23j6pVt8nqpF0kpAVHJjOQyGAVXa67hvC4FDn9j4gLPEPOiQakNKitG/u0zlwj/RM4CWf2
	2dpQur4Q==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4cZ6-00000002Mvz-0LyX
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 11:03:37 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so1438685a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 04:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038214; x=1789643014; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Hx87S2Y2VYrsz+ltlElpgYkkRP/rEKOc33NOUB4sPbE=;
        b=CleKX0RN8ZNBZbfpMKOitnEuoAq4S4eJ7gG9dkPcBm2+NmlCFbxizYyYF1xNmsrgLA
         QTKjQdYTbVRQ1ZXRkdn/cyZ4np3/731cO1+E9CzmnilEEPEwZWWsU5QwEl++7jHPpDsa
         V9yq8Lpa3AeW04cVbqAZsnd1uqhovVGbAvu7Er0+u0hvsDIoMOR4GOGWRZlf7LJ1oMz9
         XEKwf9I3UHxHegjYwXsf3iD+xi0+y0rXwtJcABQupTVmKLC5mStDBrgA5XXKx/bN8CYJ
         mgeHkYi+IguW24ipWx1FDSK2J3YTN1V/Tjhto0Ehpw4/oYyD464JDiqrVGGUuSlnbq8C
         dA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038214; x=1789643014;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hx87S2Y2VYrsz+ltlElpgYkkRP/rEKOc33NOUB4sPbE=;
        b=PK/+oZYL+0ojgH3Mi2wOrXwbj5VFHdXroQ8yBC1AtyUmGBOot7J34MAlSw8MbQIJp4
         1QiTYN30X47An0fIlpeWNhAolAE/zAEdha3smufpcspJ8wNJsL3Y3q3SwN3rdp/FJGW/
         VMS1ml4OXbat7YB2Mxzkpz6q8O9Q12sdwWh/7fN1tPIxCSPt8RDAhkcq1GTcsF7RPwVd
         6RsGSJNHuMYlT53sF1ewdGnVIGj5JGzP5haUN6D/HakNmqW/4ihK1qxFP6ZDDf58f+Mh
         t1LT2S0h8IbYw1aD/BtSgXo55YE08rIfUnci3NJ2kNRmZ/EffahrwOTWVEK56gvPUD7+
         49UQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6yUA/lCOfLdSqKDD9XscRLKEqT/KHZ4VdTVnwcXAUpxTadESUiSOFMV4ZrRvkJtcNmqI2K8mDDVJlfw==@lists.infradead.org
X-Gm-Message-State: AFuF++kcqw3otB7Gr5qi8+dA/w4lbBs40ocaT971BS+VVJFt/REwO5Xv
	zgLMBuVnDKtARQXppU0wTT/UEYqKy/2lI7M+AkG9sT68ELjwBzb8yQjI
X-Gm-Gg: AYBFou2nZ7o6Y/noq7COlLviOvNJfCyeMU/12we82zekz6djOA7s4AS3fKjCp5O4dS/
	oQIVIzru3kCntNgrQU6AzNk/CZpMZbWX2NLiTNT6HSBdn4jWlMIeOyByl/wiZ07cfyKSDnIUSot
	znt9RorHrWwF7dB5/MGUp3qdHCue+SoIjDSVYslQbE6HmctpbW8HMTPvch9C/cax+X1X9fh5WQM
	mT0RF3CTH9ltOW1YCwWjvPzf7wpq4yaGG66FRGQ13fEHqpAthc4RB21/rMLMjWRnIP41FS7daKE
	p55OTPk/mSjJARpAyIPxrW6J+xC3mLTG4EfWFO25DvH43LSQeSxqof7vSpLHTBTwIgeHZAF6O9Y
	0AqpwHH1kcDHBmZRVSQWdvg5ud1HumcM5VEHLV67IizvmJ5y2R7YUUhXG4BTlRtX+t45rKdi01t
	I02WrhgjNewe+3sBeC1ZqG4JlC/xW7epuiw9msc1J/fymtyEr1ey55Kg0Mk4wPm98dmXtwK8Nv8
	bIgj/S41tHhYWNxMx7G5RM3hFkUjUrEe0lxBPz1Mlp2Ds1Q0UpTNbE=
X-Received: by 2002:a17:90b:3e46:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-39d70a5931bmr11901184a91.10.1789038213696;
        Thu, 10 Sep 2026 04:03:33 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534152sm50133517eec.10.2026.09.10.04.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:03:33 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 08/20] KVM: selftests: Use the innermost page allocator API in the memslot perf test
In-Reply-To: <20260902164123.2546762-9-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:30:42 +0530
Message-ID: <a4pp1icl.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-9-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_120336_259377_86FBEA8B 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Sean Christopherson <seanjc@google.com> writes:

> Use the quad-underscores physical page allocator API in the memslot perf
> test in anticipation of converting the outer versions to take the memory
> region type instead of the raw memslot.  Stating the obvious, the memslot
> perf test creates and allocates from multiple memslots, and so can't use
> MEM_REGION_TEST_DATA to communicate which region/slot to allocate from.
>
> No functional change intended.
>

yup. Indeed the later APIs will drop the memslot argument from the
main/outer page allocator APIs, so we need to use the
____vm_phy_pages_alloc() variant here. The change looks good to me.

Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
