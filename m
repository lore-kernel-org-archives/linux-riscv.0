Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F8FC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 23:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/lMy2FEShJJ32VgIaQsX1b5k1aAQ7su46t408mhuws=; b=yN9M5fn3X+TZak
	7xzOabisgRSCmWp9ABllpgb1OnOo05fF9TXKNCPWXyFaK0grH46+2Uf8F0Rq1PzVPEW3XIQBTz14H
	JXkqGrqMN4Xo7kJuTX7uVZr5f1/ySxxRQk42iCtf0mgJlN1SIe3m81q8nXKVLJb0d/vfVou+njxqT
	SjlUq/09jiKXxILCqwd8oSqvdR5WvHl2HnNJStvte2siuXb2Y4UAdrukXgruNPGO1rOCvmXCaeNk7
	CzGaTrTe5xhRKhvXSpHz7uXSRYvhJhDsltcVv9UwWmxg22pso+Tdgt9zknp0HbiBYEGoXPWwN9IfI
	dfJ7j//wktQyMvRz/Efg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4sCH-007DbL-NV; Mon, 12 Dec 2022 23:26:57 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4sC6-007DQd-Si
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 23:26:49 +0000
Received: by mail-pl1-x62f.google.com with SMTP id l10so123460plb.8
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 15:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zJOQecEGgSp0glbzJ1RpRnPbkp2HAzeJE/NybulD13E=;
        b=LgVzXCUoiKNG9USGHdtxDWk3jXHPhUfF7aC6Jb6oAf8XA1bTwz+AQ/vH//iOu+Txbq
         HtNSM7bobeYY6HNyDm3070/s1Oas0aeVxdQOxg9nHQgvvOSD+HbQky0G3NWU2aHHH9iG
         JVh1AUDnlaepYuer6Ncinshp4+sTBfERSvbRGIUdHuN0fvrTLKzxKu4eop/o7jhMUBSa
         9I1Z1oUAs6TpwbdTo0ilfAV5dpWM/KOAPcjBCaf+Wh+PzYd+4+Je5We3hpfEFSHW2X9B
         XNOJfuewe5Qh+b7VEFMhtgGppnAqVlzsDeqFiGrPyEqs9m8tEG3SEwVL1QUihijPEdBo
         3YcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zJOQecEGgSp0glbzJ1RpRnPbkp2HAzeJE/NybulD13E=;
        b=ceOImfyKO8MV8UnM2CBYPypkbLxuYHRS5z+ncxMR61VvyApZfrW2zR+m4+8i2GN+cn
         xG8haYsVOxwhXYOWmN586XR+xgoHhbnco6ZHouOsm4XpNaqQeGAB0YLtjdfUl7J4pfBS
         vAtxPB6lMrZyDNfDqqd7LvBhkVIwm4MEWx17hPKxgr0wMWy3aCL57tNkz/R+uxzlXks9
         gR7J9ZzYJ2zW+wxqcX6u0ZrmCbB6AQPD1ONNKQ7fs/NNYZjCXM0IF/sAYemWLk06bsfw
         wePNKpIsDQtXxbxKVzbOBuWfhxFBSZP34edCMXMC/k0S626izpDnAGP84ncXtU/ZbTox
         MRgw==
X-Gm-Message-State: ANoB5pkeV85nDn8lhRA82mxGJRFbuwsgQHQ5miQ9P8N5yrsM1KIZD8kW
	VPhGJfCncFcZFMfUXUtsA7G5Hg==
X-Google-Smtp-Source: AA0mqf5Ct9lyTd0t0PIpKHrR2fvGzlGpqd0kxk6VIFCVK4Ckp27HzLLjvycFuCodXJHfa/pjm6FVZg==
X-Received: by 2002:a17:902:da8d:b0:189:3a04:4466 with SMTP id j13-20020a170902da8d00b001893a044466mr16713plx.2.1670887599032;
        Mon, 12 Dec 2022 15:26:39 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id z9-20020a170903018900b00189af02aba4sm6992708plg.3.2022.12.12.15.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 15:26:38 -0800 (PST)
Date: Mon, 12 Dec 2022 23:26:35 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	David Matlack <dmatlack@google.com>, Marc Zyngier <maz@kernel.org>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Nadav Amit <namit@vmware.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Yu Zhao <yuzhao@google.com>,
	Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>,
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>,
	Krish Sadhukhan <krish.sadhukhan@oracle.com>,
	Ricardo Koller <ricarkol@google.com>,
	Jing Zhang <jingzhangos@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH 00/37] KVM: Refactor the KVM/x86 TDP MMU into common
 code
Message-ID: <Y5e4qxjHWoMt8YGs@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <Y5OHVzBSHPmAq2FO@google.com>
 <eb93beee-9d43-1c1e-250c-28ab7e9ebed9@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb93beee-9d43-1c1e-250c-28ab7e9ebed9@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_152646_955099_CB3198FA 
X-CRM114-Status: GOOD (  13.55  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBEZWMgMTIsIDIwMjIsIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4gT24gMTIvOS8yMiAy
MDowNywgT2xpdmVyIFVwdG9uIHdyb3RlOgo+ID4gPiAgIC0gTmFtaW5nLiBUaGlzIHNlcmllcyBk
b2VzIG5vdCBjaGFuZ2UgdGhlIG5hbWVzIG9mIGFueSBleGlzdGluZyBjb2RlLgo+ID4gPiAgICAg
U28gYWxsIHRoZSBLVk0veDg2IFNoYWRvdyBNTVUtc3R5bGUgdGVybWlub2xvZ3kgbGlrZQo+ID4g
PiAgICAgInNoYWRvd19wYWdlIi8ic3AiLyJzcHRlIiBwZXJzaXN0cy4gU2hvdWxkIHdlIGtlZXAg
dGhhdCBzdHlsZSBpbgo+ID4gPiAgICAgY29tbW9uIGNvZGUgb3IgbW92ZSB0b3dhcmQgc29tZXRo
aW5nIGxlc3Mgc2hhZG93LXBhZ2luZy1zcGVjaWZpYz8KPiA+ID4gICAgIGUuZy4gInBhZ2VfdGFi
bGUiLyJwdCIvInB0ZSIuCj4gPiAKPiA+IEkgd291bGQgc3Ryb25nbHkgYmUgaW4gZmF2b3Igb2Yg
ZGlzY2FyZGluZyB0aGUgc2hhZG93IHBhZ2luZyByZXNpZHVlIGlmCj4gPiB4ODYgZm9sa3MgYXJl
IHdpbGxpbmcgdG8gcGFydCB3YXlzIHdpdGggaXQg8J+YhAo+IAo+IFllcywgYWJzb2x1dGVseS4g
IFNvbWV0aGluZyBsaWtlIHRvX3NoYWRvd19wYWdlLT50b19tbXVfZGF0YSwgc3AtPm1kLAo+IHNw
dC0+aHB0LCBzcHRlLT5zcHRlLCBzcHRlcC0+aHB0ZXAuCgoiaG9zdCIgd2lsbCBiZSBjb25mdXNp
bmcgaWYgd2hlbiB0aGUgcHJpbWFyeSBNTVUgaXMgaW52b2x2ZWQgdGhvdWdoLCBlLmcuIEkgYWx3
YXlzCnRoaW5rIG9mIHRoZSBwcmltYXJ5IE1NVSdzIHBhZ2UgdGFibGVzIGFzIHRoZSAiaG9zdCBw
YWdlIHRhYmxlcyIuCgpXaGF0IGlmIHdlIGtlZXAgdGhlICJTIiBmb3IgU1BUKEUpIGFuZCByZXB1
cnBvc2UgaXQgdG8gbWVhbiBTZWNvbmRhcnkgUFRFPwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
