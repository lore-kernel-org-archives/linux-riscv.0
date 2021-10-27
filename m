Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC230C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 16:55:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A917D60F38
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 16:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A917D60F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2BIxeKjAhRrX1pt8LEZXcxplmKYOGeyeYZA09zpgpE0=; b=u14KD+s/9nQAvy
	NUEYqEorqqBjYR4Nn+ruHMiMrYgZCO7tzh3BdFUFKvMNOTJg0mYmYNXpkDRWF9Cc1WQqOqakgaKHH
	S+aC/R6ZIVZUevvpf5KPiZSQLUFpa8W4zEBbE18TBWulIWUTneQFzIFTjYitTIjmL/yb81kXuPe12
	GwflFP9i2AFDq/y3EPCyj9Su5ZGmNPNMRkdN6QIGaGOylgPsoFSJsKglE2zgijXTlOFeNkmMuExgt
	lyT7+uQI+uPBvMSRNBLTZVXCNqWmNR6g/ecJk7EyQOd/kj79e+NwG25hs7IkZEfvTVa7fO6FbHoUp
	04vehZKM61ETEUAyZyMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfmD1-005W4p-QH; Wed, 27 Oct 2021 16:55:27 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfmCy-005W24-UE
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 16:55:26 +0000
Received: by mail-wr1-x435.google.com with SMTP id d10so5310434wrb.1
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 09:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CWsVp+SrjAMjXLWg5aGWLi275IB1/UGr/3Kbpvbrlz0=;
 b=U/dhtVVCVlDcYpws+z+H9Kda0couCD6neCQIXUYqlrfO99hMTp9STdc0AieEg3qQT/
 LEA+vxDrmd6yzu18iRRAB7YQmULVytVd3yh6Xi9gtG1Ybl4G92/I6YlQOxY2glyzB2ez
 RSpQKKllcdr7iULn1KqydmlmuPpSummlQFliAWT5I/z2CsL6lBTRCzfsah1skJPOy7c9
 7fl5PnuRz4XGmicNOMSDHCBzne9RpQHzLWK3ekMeRb6Bn9YJ7j+y2J1ySvyKN3NyAZOS
 WMWEP7YuQVmedJe+ydRZaG8mrxdMVK14JVyiTBZqk+ID/fmMClq1kcVaIJXjqN1JFrno
 T0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CWsVp+SrjAMjXLWg5aGWLi275IB1/UGr/3Kbpvbrlz0=;
 b=gdyOHD0Dz6z5LNeaVFCeY/UuGzNcpyv0JX+Mulka4mjeeKgBV5xmODbUluzbUULnE3
 8x3GPcsT2aGHr63IixhVDCula8Ro0o7S1JAGKeYZNqB4rd30xdqnCrp4e0vtE8RXzsOS
 j8VkMRBsuOzRUWluqXZTKQGfXR0zp5djFonpi95g/CdTilYUAqW15locuXmEBgt9mBn8
 Q0bg+37C6uB9+WShFMZrXRSuKxvY5OII8OpkxZgOJcLvsZfuw+a11ONKCc2bkLtUbYoU
 lfVARuPkzLit5zoC4IMv2IgJ24LeBdrgSKHQat53UCvOXdZSuFm3gS4Qm559bnNAochA
 Sepg==
X-Gm-Message-State: AOAM532ezIhaAc+YzarZZffa0P2jB7ISFJcNGMyBHNimju9/TwRk/xks
 ao1n9NIZ1NSDWC6R4BKaxrBykB/5+gHRQAYd0sc=
X-Google-Smtp-Source: ABdhPJyV24jXnFwVti0Sq573uCKjsBbNXwheOJlt548iRfoPnt9g9DgT6esuUDsI3g9IgU9ttKCWsBoZhmwBKODu/0Y=
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr21600827wry.321.1635353722089; 
 Wed, 27 Oct 2021 09:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211027111822.3801679-1-tongtiangen@huawei.com>
In-Reply-To: <20211027111822.3801679-1-tongtiangen@huawei.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Wed, 27 Oct 2021 18:55:10 +0200
Message-ID: <CAJ+HfNhC=hfFnjVvCf=bw+n1msRjR3gGUyapAmsRDupZ5CusrQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next,v3] riscv, bpf: Add BPF exception tables
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, 
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_095524_997612_56685A5A 
X-CRM114-Status: GOOD (  19.12  )
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

T24gV2VkLCAyNyBPY3QgMjAyMSBhdCAxMzowMywgVG9uZyBUaWFuZ2VuIDx0b25ndGlhbmdlbkBo
dWF3ZWkuY29tPiB3cm90ZToKPgo+IFdoZW4gYSB0cmFjaW5nIEJQRiBwcm9ncmFtIGF0dGVtcHRz
IHRvIHJlYWQgbWVtb3J5IHdpdGhvdXQgdXNpbmcgdGhlCj4gYnBmX3Byb2JlX3JlYWQoKSBoZWxw
ZXIsIHRoZSB2ZXJpZmllciBtYXJrcyB0aGUgbG9hZCBpbnN0cnVjdGlvbiB3aXRoCj4gdGhlIEJQ
Rl9QUk9CRV9NRU0gZmxhZy4gU2luY2UgdGhlIHJpc2N2IEpJVCBkb2VzIG5vdCBjdXJyZW50bHkg
cmVjb2duaXplCj4gdGhpcyBmbGFnIGl0IGZhbGxzIGJhY2sgdG8gdGhlIGludGVycHJldGVyLgo+
Cj4gQWRkIHN1cHBvcnQgZm9yIEJQRl9QUk9CRV9NRU0sIGJ5IGFwcGVuZGluZyBhbiBleGNlcHRp
b24gdGFibGUgdG8gdGhlCj4gQlBGIHByb2dyYW0uIElmIHRoZSBsb2FkIGluc3RydWN0aW9uIGNh
dXNlcyBhIGRhdGEgYWJvcnQsIHRoZSBmaXh1cAo+IGluZnJhc3RydWN0dXJlIGZpbmRzIHRoZSBl
eGNlcHRpb24gdGFibGUgYW5kIGZpeGVzIHVwIHRoZSBmYXVsdCwgYnkKPiBjbGVhcmluZyB0aGUg
ZGVzdGluYXRpb24gcmVnaXN0ZXIgYW5kIGp1bXBpbmcgb3ZlciB0aGUgZmF1bHRpbmcKPiBpbnN0
cnVjdGlvbi4KPgo+IEEgbW9yZSBnZW5lcmljIHNvbHV0aW9uIHdvdWxkIGFkZCBhICJoYW5kbGVy
IiBmaWVsZCB0byB0aGUgdGFibGUgZW50cnksCj4gbGlrZSBvbiB4ODYgYW5kIHMzOTAuCj4KPiBU
aGUgc2FtZSBpc3N1ZSBpbiBBUk02NCBpcyBmaXhlZCBpbjoKPiBjb21taXQgODAwODM0Mjg1MzYx
ICgiYnBmLCBhcm02NDogQWRkIEJQRiBleGNlcHRpb24gdGFibGVzIikKPgo+IFNpZ25lZC1vZmYt
Ynk6IFRvbmcgVGlhbmdlbiA8dG9uZ3RpYW5nZW5AaHVhd2VpLmNvbT4KPiBUZXN0ZWQtYnk6IFB1
IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4gLS0tCj4gdjM6Cj4gTW9kaWZ5IGFjY29yZGlu
ZyB0byBCasO2cm4ncyBjb21tZW50cywgbWFpbmx5IGNvZGUgb3B0aW1pemF0aW9uLgoKVGhhbmsg
eW91IQoKSSByYW4gdGhpcyBwYXRjaCBhZ2FpbnN0IHRoZSB0ZXN0X2JwZi5rbywgYW5kIHNlbGZ0
ZXN0cy9icGYgLS0gbm8KcmVncmVzc2lvbnMsIGFuZCBhZnRlciB0aGUgcGF0Y2ggaXMgYXBwbGll
ZCBtb3JlIHRlc3RzIHBhc3Nlcy4gWWF5IQoKT24gYSByZWxhdGVkIG5vdGUuIFRoZSBSSVNDLVYg
c2VsZnRlc3RzL2JwZiBpcyBpbiBhIHByZXR0eSBsb3VzeQpzdGF0ZS4gSSdsbCBzZW5kIGEgY2xl
YW51cCBwYXRjaCBmb3IgdGhlbSBzb29uaXNoLiBFLmcuOgoKKiBSSVNDLVYgaXMgbWlzc2luZyBp
biBicGZfdHJhY2luZy5oIChsaWJicGYpCiogU29tZSBwcm9ncmFtcyBkb24ndCBjb252ZXJnZSBp
biAxNiBzdGVwcywgSSBoYWQgdG8gaW5jcmVhc2UgaXQgdG8gfjMyCiogVGhlIHNlbGZ0ZXN0L2Jw
ZiBNYWtlZmlsZSBuZWVkZWQgc29tZSBSViBzcGVjaWZpYyBjaGFuZ2VzCiogLi4uYSBsb3Qgb2Yg
dGVzdHMgc3RpbGwgZG9uJ3QgcGFzcywgYW5kIG5lZWRzIHRvIGJlIGxvb2tlZCBpbiB0bwoKRmVl
bCBmcmVlIHRvIGFkZDoKCkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3Jn
PgoKPiB2MjoKPiBNb2RpZnkgYWNjb3JkaW5nIHRvIEJqw7ZybidzIGNvbW1lbnRzLCBtYWlubHkg
cmVtb3ZlcyByZWR1bmRhbnQgaGVhZCBmaWxlcwo+IGV4dGFibGUuaCBhbmQgc29tZSBjb2RlIHN0
eWxlIGlzc3Vlcy4KPgo+ICBhcmNoL3Jpc2N2L21tL2V4dGFibGUuYyAgICAgICAgIHwgIDE5ICsr
Ky0KPiAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oICAgICAgICB8ICAgMSArCj4gIGFyY2gvcmlz
Y3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgfCAxODUgKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0KPiAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb3JlLmMgICB8ICAxOSArKy0tCj4gIDQg
ZmlsZXMgY2hhbmdlZCwgMTc3IGluc2VydGlvbnMoKyksIDQ3IGRlbGV0aW9ucygtKQo+CgpbLi4u
XQoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
