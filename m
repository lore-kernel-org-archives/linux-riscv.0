Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2670EC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Apr 2022 23:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47QdMnwQbOFtkYdLXBzaFyzRXxLolXCWLAALH9/RJ7E=; b=lEdcx5AR2aQnqD
	Ln1claqOZsidDBT+tJqSEqyp9dOm78flSO6HV3IWoXNqPf0okDLseeNkwSt5MK8dvIQ/KZiqhdCw5
	gucEA60hxgljJ/QDZR3+zAlN06VSFcvEWPpIWWF7R/p9vdg5c6WrUgmqzUooYlYKhkyZHdMc+/Xb8
	asYSuyKXFp6ZZCc5+2ABeAMOTis7c+JrJPdGiesDkwpJfstYNyTybh4CIoH1RklHsl7vOf5NsWVx5
	2bOVONmxLhKWSy3fzn5Vbszgzu9lWQETzvgrVVVvrFFShTalGP5kdoXxYmxZoOs1u/7UJpDL5wnAS
	DFO+YDhjir76dEzx6Zpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngb0I-000r9r-9O; Mon, 18 Apr 2022 23:41:58 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngb0F-000r6w-Dx
 for linux-riscv@lists.infradead.org; Mon, 18 Apr 2022 23:41:56 +0000
Received: by mail-ej1-x62e.google.com with SMTP id s18so29692504ejr.0
 for <linux-riscv@lists.infradead.org>; Mon, 18 Apr 2022 16:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=oMbj/ngB4Xh3u5slAt5+IUuTIHe0QYck6hgIDhGGZyI=;
 b=Lw0HPpmEilJ7jamzGeotijctF5AHV80XNoUo8pNNvFpfqAW9qsRPm/r+bOi2tkAhr5
 1PPUiSSvi4JLJnb9CzZWaBxulsm8Sf5AnLlXUK54WZ1QIKpqyoLBl5i3HtqNle0zAKCs
 PNZvloGV6FslYHe8ECOL+8639jNU4zYpipxNpzmepXt8UtaovU3gsMifDRRnI3Z/1TuS
 f5p9a2xttlhYAVQQwRKk2KNF/TfO5BZ0qAIRJICKYXfuYmqphH3CzycrqYKxf8tSFDzG
 UPAHPqRub1d99fqAz2wFuB2Tf7s+HgWh/KGq2VGpMF8bcCgBhK1bmbrjyaya8b/kdHqU
 wgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oMbj/ngB4Xh3u5slAt5+IUuTIHe0QYck6hgIDhGGZyI=;
 b=lHms4l3HYN+wK7zSPMxR4jxETk9MoVA3ruIoLmro6IVaIGSyxdO0YhwvEvOC36EXHF
 ylj5FyPlTBoBGSR8t3SKiBRhE1TNC/ujs8bvfMk1JVCu05WMJRZykQQwAWaT2RYgmgeL
 GDaqFx1/cgwiW3UUdTTwoi8Nti7o48+ThSvZRxBoi15HNs7KLIqotplvkZ7Hn1pBgAiI
 e4DBCGAV60tqZUzOC+0MsWQgymSeD3IGMZ6m3yDZxP39oF0JDf/LAnglp7XAKfB7L0d2
 /doALd0ls6LxLkfEgaBLZ9A2J7+RW/AmfIgDBETst5/qreOl7ErcppTWgyQuNG4n4x78
 BFMw==
X-Gm-Message-State: AOAM532rGB7qvXol58CNhhdrprUI/m/FAuJDNBb8t7FJadQj0yJ2fbI8
 djlBXqtWEWF9M2CyNrRQ1Cw=
X-Google-Smtp-Source: ABdhPJzskXbKBYI3v3yN/vt7djM1RFhBYN1rxNho2kAMhgGvPFd+6Xbx3xvzUB2PB+xvJucZdZvvcQ==
X-Received: by 2002:a17:906:1194:b0:6ec:8197:e892 with SMTP id
 n20-20020a170906119400b006ec8197e892mr10660456eja.84.1650325306122; 
 Mon, 18 Apr 2022 16:41:46 -0700 (PDT)
Received: from anparri (host-82-53-3-95.retail.telecomitalia.it. [82.53.3.95])
 by smtp.gmail.com with ESMTPSA id
 fq6-20020a1709069d8600b006e891c0b7e0sm4979497ejc.129.2022.04.18.16.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 16:41:45 -0700 (PDT)
Date: Tue, 19 Apr 2022 01:41:37 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Daniel Lustig <dlustig@nvidia.com>,
 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V2 0/3] riscv: atomic: Optimize AMO instructions usage
Message-ID: <20220418234137.GA444607@anparri>
References: <20220412034957.1481088-1-guoren@kernel.org>
 <YlbwOG46mCR8Q5tJ@tardis>
 <CAJF2gTRws6RqKmJHBdKsycWSkFgYna_MocJ+qp3Z9r1v7mQzsg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTRws6RqKmJHBdKsycWSkFgYna_MocJ+qp3Z9r1v7mQzsg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_164155_498239_864A2818 
X-CRM114-Status: GOOD (  10.32  )
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

PiA+IFNlZW1zIHRvIG1lIHRoYXQgeW91IGFyZSBiYXNpY2FsbHkgcmV2ZXJ0aW5nIDVjZTZjMWYz
NTM1Zgo+ID4gKCJyaXNjdi9hdG9taWM6IFN0cmVuZ3RoZW4gaW1wbGVtZW50YXRpb25zIHdpdGgg
ZmVuY2VzIikuIFRoYXQgY29tbWl0Cj4gPiBmaXhlZCBhbiBtZW1vcnkgb3JkZXJpbmcgaXNzdWUs
IGNvdWxkIHlvdSBleHBsYWluIHdoeSB0aGUgaXNzdWUgbm8KPiA+IGxvbmdlciBuZWVkcyBhIGZp
eD8KPiAKPiBJJ20gbm90IHJldmVydGluZyB0aGUgcHJpb3IgcGF0Y2gsIGp1c3Qgb3B0aW1pemlu
ZyBpdC4KPiAKPiBJbiBSSVNDLVYg4oCcQeKAnSBTdGFuZGFyZCBFeHRlbnNpb24gZm9yIEF0b21p
YyBJbnN0cnVjdGlvbnMgc3BlYywgaXQgc2FpZDoKCldpdGggcmVmZXJlbmNlIHRvIHRoZSBSSVND
LVYgaGVyZCBzcGVjaWZpY2F0aW9uIGF0OgoKICBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Yvcmlz
Y3YtaXNhLW1hbnVhbC5naXQKCnRoZSBpc3N1ZSwgYmV0dGVyLCBsci1zYy1hcXJsLXBhaXItdnMt
ZnVsbC1iYXJyaWVyIHNlZW1zIHRvIF9ubyBsb25nZXJfCm5lZWQgYSBmaXggc2luY2UgY29tbWl0
OgoKICAwM2E1ZTcyMmZjMGYgKCJVcGRhdGVzIHRvIHRoZSBtZW1vcnkgY29uc2lzdGVuY3kgbW9k
ZWwgc3BlYyIpCgooaGVyZSBhIHRlbXBsYXRlLCB0byBkb3VibGUgY2hlY2s6CgogIGh0dHBzOi8v
Z2l0aHViLmNvbS9saXRtdXMtdGVzdHMvbGl0bXVzLXRlc3RzLXJpc2N2L2Jsb2IvbWFzdGVyL3Rl
c3RzL25vbi1taXhlZC1zaXplL0hBTkQvTFItU0MtTk9ULUZFTkNFLmxpdG11cyApCgpJIGRlZmVy
IHRvIERhbmllbC9vdGhlcnMgZm9yIGEgImJpLXNlY3Rpb24iIG9mIHRoZSBwcm9zZSBzcGVjaWZp
Y2F0aW9uLgo7LSkKCiAgQW5kcmVhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
