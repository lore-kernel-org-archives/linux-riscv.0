Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42834C47422
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 02:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JWie8VifH132WL11OwgqSQ3/1K4ozL9eku4wss1pR00=; b=3rlcdvcjEJw+UW
	b5R0QLYx870ltLzWK/YHSkCht6PEzPIvwzeNXqRBe/7u9iBE0zQ+M9SgAaCdNSdnGmta/ZdP7AnTY
	kLCOvuvvtNpInGw8u1X2JfH5OZ5QXKoTOJqpreaFis7y4xKq89Hm5/k09uDqxQNImcXWjHZ18hIDi
	a9iVIi2eErZ3mG9zAhT6z7ZBdA/Hllngif4spnIXIbEOMFzcfeysoTUVrPzQH4WUawcUvdls3vvGo
	habV8lIgVTbO0oKz9sYheBIn6sJq0zy0kZB/dIVyHWzv9L06uY7QCoUfG1XHjSN3jz0e/KJy8ETLB
	TguNQ+86C2HGb/QjRwzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQehn-004IRS-3D;
	Fri, 19 Jan 2024 02:34:04 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQehh-004IQj-2C
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 02:34:00 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2107f19e331so238263fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jan 2024 18:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705631569; x=1706236369; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIRCn6aZ1zwVrlCGp/XopfDjRvQ489ZkYpkYdsOp7rI=;
        b=c2hOP8UDwCp9Gii6k17KfFUBFoCkKZqYq1xd/msSEkvLEKN9hwMWpu+isK7UljUq14
         zLeEwXwmFjH3qsxyyDltXLQRbmauMx6ozyC8Xc2ysFeQ7MejqFGu5XJTwEWKkpbtm3Bj
         plj5bZwgfySFbA8CBgFpdjC/rT5yoIEqwpbG06OYHOw1voJHVXSsLvXxylPlr6RbHCPZ
         C4pCFSIoR+T7rC8hfzm91xHwReRQTYG/2tS+ff3OM+GbDZi2cqUN6Kg9e8x1RbGws2As
         8a6+BH1S9/XWd4Ixufo+FaHXKUCSrVbbYXfxwLFU4b3o7FUisTLe6YlJscIntzVhylV5
         dAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705631569; x=1706236369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NIRCn6aZ1zwVrlCGp/XopfDjRvQ489ZkYpkYdsOp7rI=;
        b=v+jXVauaHhVmXVKP75ceiLJIfNnmdN5V6xUgHXgjRHkosObccMI3nf41yoUGGgKCRF
         7NBA6gmNAT6G7sTdI5lpdMYhiTha0wraVF2nE4CQlpXP0lamdkVWXQ52yoisifD+sDZX
         jTaRY0y1UK6X0c3YyuW2wgFI+bogl9N7SaKpHQVBM8OUTk3xzKtOS301CcM+VLSS8OZR
         /Qxcq7b1opEDhg2SlRYBz9/Td2RrcF/n16ByRpHjLQVFVyYe33x5BTpBuTAdC3tHQpH7
         zNdUTlFCRfjBMJ9Fw06Lq2mGV3GYa+nBxEdh8wsA9N2hsIwdLCMWN+JZT5QwxYXgbVSE
         rkyQ==
X-Gm-Message-State: AOJu0YznQ/71L0guIBI1E0tm/zxImlPHC3WTvx7FuErk0BdMg7IgDm+q
	a+nEQwUtblt1m0/jHsaeiDw/mpRpkt2ZQMrSbmfW9JMP/gYmYLdnNjOZHt3bvsFDBcyIwk0DOuT
	phDcfCz0Pxav35ZjBDk5wUwRZIq8pB0bK7qw5GJmUstqb+vRHZFMAVw==
X-Google-Smtp-Source: AGHT+IE5Xo4GdEOE+8nwejdOQ+igZ5AX+x9j//Nh9tR7gXKW0tx/LbqL7pGJJZtjL4lmq60adqKobu04y1RWiZzZBKc=
X-Received: by 2002:a05:6870:c18c:b0:210:b88b:baf9 with SMTP id
 h12-20020a056870c18c00b00210b88bbaf9mr1710209oad.48.1705631569123; Thu, 18
 Jan 2024 18:32:49 -0800 (PST)
MIME-Version: 1.0
References: <CAEEQ3wn=TkGULh=kqUxxi913_AVrRW1Edb6tTe7CuKS=YkP1BA@mail.gmail.com>
 <20240118-enjoyment-defuse-3b5a2b76afb7@spud>
In-Reply-To: <20240118-enjoyment-defuse-3b5a2b76afb7@spud>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 19 Jan 2024 10:32:38 +0800
Message-ID: <CAEEQ3w=_SNRVCg9tGU+SjPVO57FhGQW7Pk9BZ-f97Lh5U0LXEA@mail.gmail.com>
Subject: Re: [External] Re: Current status of RISC-V init_cache_level()
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_183357_890145_5880AEFB 
X-CRM114-Status: GOOD (  15.67  )
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

SGkgQ29ub3IsCgpPbiBUaHUsIEphbiAxOCwgMjAyNCBhdCA5OjI14oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgSmFuIDE4LCAyMDI0IGF0IDA3
OjQwOjQyUE0gKzA4MDAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4gPiBIaSBDb25vciwKPgo+IEZpcnN0
bHksIHBsZWFzZSBkb24ndCBzZW5kIG1lIG9mZi1saXN0IG1haWxzIGFib3V0IHN1Y2ggdGhpbmdz
Cj4gYW5kIGluc3RlYWQsIHBsZWFzZSByZXBseSB0byB0aGUgcmVsZXZhbnQgdGhyZWFkcyBvbiBs
a21sLgo+Cj4gPiBUaGVyZSBpcyBubyBjYWNoZSBzdWJkaXJlY3RvcnkgaW4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MC8sIHNvCj4gPiBsc2NwdSBjYW5ub3Qgc2VlIHRoZSBjYWNoZSBpbmZv
cm1hdGlvbi4gSSBmb3VuZCB0aGF0IHRoZSByZWFzb24gaXMKPiA+IHRoYXQgaW5pdF9jYWNoZV9s
ZXZlbCgpIGlzIG5vdCBpbXBsZW1lbnRlZCBvbiBSSVNDLVYuCj4KPiBXaGF0IHZlcnNpb24gb2Yg
dGhlIGtlcm5lbCBhcmUgeW91IHVzaW5nPyBJIGhhZCBhIGJyaWVmIGNoZWNrIHRvIG1ha2UKPiBz
dXJlIHNvbWV0aGluZyBoYWQgbm90IGdvbmUgYXdyeSByZWNlbnRseSBhbmQgSSBjb3VsZCBzZWUg
dGhlbSBvbiBteQo+IHN5c3RlbS4gV2hhdCBkbyB0aGUgY3B1IG5vZGVzIGluIHlvdXIgRFQgbG9v
ayBsaWtlLCBhc3N1bWluZyB5b3UgYXJlCj4gb24gYSBEVCBzeXN0ZW0/CgpUaGUgcmVzdWx0cyBv
ZiB0b3AgY29tbWl0IHVzaW5nIGxpbnV4LW5leHQgb24gcWVtdSwgSXQgc2hvdWxkIG5vdAptYXR0
ZXIgaWYgaXQgaXMgY29tYmluZWQgd2l0aCBEVCwgYmVjYXVzZSB0aGUgZm9sbG93aW5nIGZ1bmN0
aW9uIGZsb3cKZGlyZWN0bHkgZmFpbHMuCmNhY2hlaW5mb19zeXNmc19pbml0KCkuLi5pbml0X2Nh
Y2hlX2xldmVsKCkKaW50IF9fd2VhayBpbml0X2NhY2hlX2xldmVsKHVuc2lnbmVkIGludCBjcHUp
CnsKcmV0dXJuIC1FTk9FTlQ7Cn0KSXMgaXQgbmVjZXNzYXJ5IHRvIGltcGxlbWVudCBhbiBpbml0
X2NhY2hlX2xldmVsKCkgb24gUklTQy1WIGxpa2Ugb3RoZXIgYXJjaGVzPwoKQlRXLCBEb2VzIGNh
dCAvcHJvYy9jcHVpbmZvIGV4cG9zZSBjYWNoZS1yZWxhdGVkIGluZm9ybWF0aW9uLCBzdWNoIGFz
CmNhY2hlIHNpemU/CgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
