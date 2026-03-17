Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FBEF33802
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 06:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AnM9DU8VVeubUFN8ley+1VOwM9AKqdCTgR90G7MzoNI=; b=Sc+iCRJ3tpiAtd
	qwzvvSc+hV2VHd7Ri9aw4RNsHaTV/6KZJa4/vY1wGuZZuftfC2aipFTu8jecpMvp2Nc0/2YabCVCr
	rJlP8NdY6JRT3OXpdO+fkZDkAFCROosZJtysLWOvjG6o6ZQSIGbrk1RvBvSfZ+c1BekPGRVXi2qYv
	lz9GIpLJ+3Dpjc8pqu551pAjLwuHpYpcbvOOl/vyYo4Rg1t20g8zEkxHhxy+0mTnVjROWTQu2jlgk
	Is9iCayphgqCWEr9XDrqewwyRh0qCsWW2VuNjQHBLpwunYfRvlaoVVzgdrQKLDSsVRVeW+1KqFsZm
	omz4y+j2an93DjJEIcqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Nvk-00000005V47-1f7m;
	Tue, 17 Mar 2026 06:29:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Nvi-00000005V3k-3PJV
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 06:29:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 408B8442E5
	for <linux-riscv@lists.infradead.org>; Tue, 17 Mar 2026 06:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201C1C19424
	for <linux-riscv@lists.infradead.org>; Tue, 17 Mar 2026 06:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773728962;
	bh=eCiKRyoDAzKNcTc0XsJk4iW3vQZugoEMQp0SQuxx7CA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VjHacC/8FdACMbK6ZQ3iSWuPyV3khiCNBlCPf3ZLxirZ7gQYmgHytqYXG3Ss3utf2
	 ib1639oiQIddZPKO2RsdlurBgzHCUTBD6nfwPntBJ0jCwPOiVmrF5QekBOCS/H5Qq1
	 xgjOCXElPosQY4Hlf7LebOJXJsxbPdh8VW/n1Vk5Rm3TxeA5ETssbdfPtDL+3XaBO9
	 /JuL6bfB/vHVk3051d91dpGc8ApeJbBhBPWEruW5YTgl6LWvZhTvO/ZKKaEvS8GBVM
	 327YTigTfgIT0sCJbIgWiv5EYe8k4ZFfiJIIc/Qdr3scZxGE5xWJtf9W8sTzTLPSXm
	 n8212MZTDwKLA==
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so62501495e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 23:29:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUiYGSoZImbZgbEogW9DeZxeIViDVNHZpBTs/1bU052+g9ngWKksgEu17TtlosC1dcJL0/PUMgexBqDAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2jWcMFYAdjgfBPgrA0P5uHkvJrkllI99fRaM1WMyvgr/rLKmF
	Ox7DNUzrybQngmebM2f+uLqA3rFWukysRabFED05lc0dJnVraShOojzSpK5TxIP3Rc/DNA2w3w2
	8Bb035JpITsDTdFvKqPfsOu+TMvI/tRg=
X-Received: by 2002:a05:600c:c4ac:b0:485:40a4:364 with SMTP id
 5b1f17b1804b1-4855670c2a5mr259125285e9.26.1773728960630; Mon, 16 Mar 2026
 23:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260317034847.4136-1-cp0613@linux.alibaba.com>
In-Reply-To: <20260317034847.4136-1-cp0613@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 17 Mar 2026 14:29:08 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRYfvFCeHx4yxdh8tfn1GLTC+UN7vtrTokmkmb2Z6=vKg@mail.gmail.com>
X-Gm-Features: AaiRm515znQBvPe7b1QWk6C1XHuW373cVtMlbUs1J4rEm3b0iHNiaSsIo_5SmLg
Message-ID: <CAJF2gTRYfvFCeHx4yxdh8tfn1GLTC+UN7vtrTokmkmb2Z6=vKg@mail.gmail.com>
Subject: Re: [PATCH] perf symbol: Add RISCV case in get_plt_sizes
To: cp0613@linux.alibaba.com
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, irogers@google.com, pjw@kernel.org, alex@ghiti.fr, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_232926_897488_CCB780ED 
X-CRM114-Status: GOOD (  18.31  )
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

T24gVHVlLCBNYXIgMTcsIDIwMjYgYXQgMTE6NDnigK9BTSA8Y3AwNjEzQGxpbnV4LmFsaWJhYmEu
Y29tPiB3cm90ZToKPgo+IEZyb206IENoZW4gUGVpIDxjcDA2MTNAbGludXguYWxpYmFiYS5jb20+
Cj4KPiBBY2NvcmRpbmcgdG8gUklTQy1WIHBzQUJJIHNwZWNpZmljYXRpb24sIHRoZSBQTFQgKFBy
b2dyYW0gTGlua2FnZSBUYWJsZSkKPiBoYXMgdGhlIGZvbGxvd2luZyBsYXlvdXQ6Cj4gLSBUaGUg
Zmlyc3QgUExUIGVudHJ5IG9jY3VwaWVzIHR3byAxNi1ieXRlIGVudHJpZXMgKDMyIGJ5dGVzIHRv
dGFsKQo+IC0gU3Vic2VxdWVudCBQTFQgZW50cmllcyB0YWtlIHVwIDE2IGJ5dGVzIGVhY2gKPgo+
IFRoaXMgYWxpZ25zIHdpdGggdGhlIGJpbnV0aWxzLWdkYiBpbXBsZW1lbnRhdGlvbiB3aGljaCBk
ZWZpbmVzIHRoZSBzYW1lCj4gUExUIHNpemVzIGZvciBSSVNDLVYgYXJjaGl0ZWN0dXJlLgo+Cj4g
VXBkYXRlIGdldF9wbHRfc2l6ZXMoKSB0byBzZXQgcGx0X2hlYWRlcl9zaXplPTMyIGFuZCBwbHRf
ZW50cnlfc2l6ZT0xNgo+IGZvciBFTV9SSVNDViwgbWF0Y2hpbmcgdGhlIGFyY2hpdGVjdHVyZSdz
IHN0YW5kYXJkIEFCSS4KPgo+IFNpbmNlIEFBUkNINjQsIExPT05HQVJDSCwgYW5kIFJJU0NWIGhh
dmUgdGhlIHNhbWUgUExUIHNpemUgZGVmaW5pdGlvbiwKPiB0aGV5IGFyZSBtZXJnZWQgdG9nZXRo
ZXIuCj4KPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1lbGYt
cHNhYmktZG9jCj4gTGluazogaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9naXQvP3A9YmludXRpbHMt
Z2RiLmdpdDthPWJsb2I7Zj1iZmQvZWxmbm4tcmlzY3YuYwoKSSBkb24ndCB0aGluayBwdXR0aW5n
IExpbmsgaGVyZSBpcyBhIGdvb2QgaWRlYS4gSnVzdCBjb3B5IHRoZSBwYXJ0IG9mCnRoZSBwc2Fi
aSBzcGVjIHYxLjAgaGVyZToKCjguNC42LiBQcm9ncmFtIExpbmthZ2UgVGFibGUKLi4uClRoZSBm
aXJzdCBlbnRyeSBpbiB0aGUgUExUIG9jY3VwaWVzIHR3byAxNiBieXRlIGVudHJpZXM6Ci4uLgpT
dWJzZXF1ZW50IGZ1bmN0aW9uIGVudHJ5IHN0dWJzIGluIHRoZSBQTFQgdGFrZSB1cCAxNiBieXRl
cyBhbmQgbG9hZCBhCmZ1bmN0aW9uIHBvaW50ZXIgZnJvbSB0aGUgR09ULgoKRm9yIG90aGVyczoK
UmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKCj4KPgo+Cj4gU2lnbmVk
LW9mZi1ieTogQ2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4KPiAtLS0KPiAgdG9v
bHMvcGVyZi91dGlsL3N5bWJvbC1lbGYuYyB8IDQgKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi91
dGlsL3N5bWJvbC1lbGYuYyBiL3Rvb2xzL3BlcmYvdXRpbC9zeW1ib2wtZWxmLmMKPiBpbmRleCA3
NjkxMmM2MmI2YTAuLjgwNjkzNmQ5NTUyMyAxMDA2NDQKPiAtLS0gYS90b29scy9wZXJmL3V0aWwv
c3ltYm9sLWVsZi5jCj4gKysrIGIvdG9vbHMvcGVyZi91dGlsL3N5bWJvbC1lbGYuYwo+IEBAIC0z
NzIsMTAgKzM3Miw4IEBAIHN0YXRpYyBib29sIGdldF9wbHRfc2l6ZXMoc3RydWN0IGRzbyAqZHNv
LCBHRWxmX0VoZHIgKmVoZHIsIEdFbGZfU2hkciAqc2hkcl9wbHQsCj4gICAgICAgICAgICAgICAg
ICpwbHRfZW50cnlfc2l6ZSA9IDEyOwo+ICAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiAg
ICAgICAgIGNhc2UgRU1fQUFSQ0g2NDoKPiAtICAgICAgICAgICAgICAgKnBsdF9oZWFkZXJfc2l6
ZSA9IDMyOwo+IC0gICAgICAgICAgICAgICAqcGx0X2VudHJ5X3NpemUgPSAxNjsKPiAtICAgICAg
ICAgICAgICAgcmV0dXJuIHRydWU7Cj4gICAgICAgICBjYXNlIEVNX0xPT05HQVJDSDoKPiArICAg
ICAgIGNhc2UgRU1fUklTQ1Y6Cj4gICAgICAgICAgICAgICAgICpwbHRfaGVhZGVyX3NpemUgPSAz
MjsKPiAgICAgICAgICAgICAgICAgKnBsdF9lbnRyeV9zaXplID0gMTY7Cj4gICAgICAgICAgICAg
ICAgIHJldHVybiB0cnVlOwo+IC0tCj4gMi41MC4xCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8g
UmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
