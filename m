Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56603C83F0F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 03:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIJokKf1jtVm7BMOFWy3A/rtHNNALPAf1WaVqnBrcVw=; b=gwvkCf+JoKXntT
	G1v8/sPcYYghqUYIJaDoOrj7cc5Dod5w0M0McEgki3fFsDFP3jh2mNPo21x4w5ATBXZHvcgi/hLiP
	rOcfF98D3Q6sI8gY+H0sJGvxbnmpFYW6KaYREsaea/l2XYxEmxv4SciKjQkcCdhBTQm357+jhaCMS
	ovuNY4WzD53N8+hIfRdH8ZZzN4zmXXs34wYiRgQdAWcIp3sG8dcYTd+doNQG+UOlxGGI1aIiBA1ZL
	hDKUp4TC351FuTdrXY21cLh90m2+2s/TEA1AkMcXX2MIVQH8IqvYlAbxijiawGBO7Xh+CGuwYRzzX
	G4hc5h6XVR1MUfbK2Blw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZiLN-0000000AcgL-458g;
	Thu, 10 Jul 2025 03:53:09 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZiDn-0000000Ac1v-4B0b
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 03:45:22 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-73a43d327d6so281844a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Jul 2025 20:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1752119118; x=1752723918; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MoQm87c8Z8k5cIMa6HiSZvjUkFd8qA4WK0ftEEUX+Q=;
        b=iANqMB8+MYzEHuuoNeg3z9tZ/usWUGofXw4eRRSeg9UiKr5ERQtt10byGZIi2fJslx
         9stIYajLmKeLgc8nNZbaoJdy8j4Xwd1LevKWbJVezBVClPXiWTzo2IZoMEi2zX+1R356
         lrpzXkEXo1jR2Ruzurdc4UC3ZJRl2C3qUBgQvYEdO06sLW5NCGQHRuM5+UZzQcqZhXrx
         ARRaeYGdOxrCfPi1cTPSgK6s6vW4aaDlouj6qDb69ILOxZmHMR326QO+2WVuyt21sRwh
         gWzV4Pt7SMboMviv+XV7NJtGZ2bbqrgVht2I1d0D4uHF9S3RptprTn4OlVsGUuntREmY
         zSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752119118; x=1752723918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MoQm87c8Z8k5cIMa6HiSZvjUkFd8qA4WK0ftEEUX+Q=;
        b=SP0ajKoaDx4BmLlOItsgwCyq4yo8fngpGDB9XwRnOn2ahcXcJ6V3Hnlh/rJzwMq7SP
         3B0gwywIwhZvoIxHujb3xpW23oM8dXE7oTTZlNCC82Mrjebn9KpSx3ECIeWF1m9PDJq6
         7sBp9L39BV9Wl5eHhLtlPK5yENucOBDj39DumkFAd0DV7iTFUUWgeybfTkDyx3nzS8wW
         N61nZJm1LWLWHWn7IZeZYPR+RWTVyOrfa/0neQOwajUmwnJGrZTUb0NHros1Bj6zq0/I
         48AhW+4j7MwpMR7Ez/0ND0SSxc0J2pVkiywNSiuXwSVgSi5ht9sOoyTTdYTPq4ulV+By
         NeUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAUt1ENykY6bkIWDZCSw7SLfKtC5bo33h4EU13Kt5XfbPj+qonsOuiADqRtL/VfDxq0+mUuLE9Opd9yg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSdmLuBKM+QBAgGBKvdNoqg/K5rWBLWhEFQhIR/NZ6nFw1+MQ7
	QrRMIh4gT5jPlLTcCsMGB0bO4KyLNhGpQNcahCCYatN0IkLqTzMNr8Tnlg6kHcY/lUgnnAWJ81x
	w20eOHNHYE0uWc70YARKa/uTXryd5+/gUGRAyizZTJg==
X-Gm-Gg: ASbGncsvCIaupqu2Fw0CpSVQAt1OCOKUJD4yjbFB4Thr6cJKWJVuv8cLq1/7Gi2nm9F
	gvvf7uivEAB7x42StE+mhOEmEirm8hFhNcKN4q1OpYEG8oF/x+/VYmGdeczD4saZtOEqWLbWO2i
	2C/WQ7CTpG3ntpwMJjxJYQ73r3q//NE/Dki8I8bA/IxrPVmQ==
X-Google-Smtp-Source: AGHT+IHRyVkZ57nzhyTKCltTrLPpMwsHIDQ7uc0ufm1hakxjYl3N48OH2yPl7P6OWGuq8y5vu9wPIRf0jtP4zFgzCA0=
X-Received: by 2002:a05:6830:730d:b0:739:f13a:6f41 with SMTP id
 46e09a7af769-73cf06820a7mr1087123a34.25.1752119117879; Wed, 09 Jul 2025
 20:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250704084500.62688-1-cuiyunhui@bytedance.com>
 <DB5U402ARSEO.4H4PE19LGCR7@ventanamicro.com> <CAEEQ3w=V6-d+YSWP=0WMt6UAZexrazq0UQjdyUmS3AnMtkdoKQ@mail.gmail.com>
 <DB6MLPA3BJ75.2U5FP5JSJD2LO@ventanamicro.com> <CAEEQ3wkoy3Jr0vZk=X4U56KYPq3=5t7Wr4RE6uNby3MS5qzh-g@mail.gmail.com>
 <DB7L9ZHZI3AI.36SXWX2SO9OS7@ventanamicro.com>
In-Reply-To: <DB7L9ZHZI3AI.36SXWX2SO9OS7@ventanamicro.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 10 Jul 2025 11:45:06 +0800
X-Gm-Features: Ac12FXyE0pTXhJgf-CmJFYzzVTnilQd8t8nNTo1YCw7wwl6W4gnmmliWfCBZFlE
Message-ID: <CAEEQ3wnaL5X_jXEmbbWFp3jx1Aq=02Gf7kDNBS=wcPyfEq7yBw@mail.gmail.com>
Subject: Re: [External] [PATCH] RISC-V: store percpu offset in CSR_SCRATCH
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, andybnac@gmail.com, 
	bjorn@rivosinc.com, cyrilbur@tenstorrent.com, rostedt@goodmis.org, 
	puranjay@kernel.org, ben.dooks@codethink.co.uk, zhangchunyan@iscas.ac.cn, 
	ruanjinjie@huawei.com, jszhang@kernel.org, charlie@rivosinc.com, 
	cleger@rivosinc.com, antonb@tenstorrent.com, ajones@ventanamicro.com, 
	debug@rivosinc.com, haibo1.xu@intel.com, samuel.holland@sifive.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>, wangziang.ok@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_204520_381371_78963282 
X-CRM114-Status: GOOD (  12.64  )
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

SGkgUmFkaW0sCgpPbiBXZWQsIEp1bCA5LCAyMDI1IGF0IDEwOjIw4oCvUE0gUmFkaW0gS3LEjW3D
ocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gMjAyNS0wNy0wOVQxOTo0
MjoyNiswODowMCwgeXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Ogo+ID4gQmVu
Y2ggcGxhdGZvcm06IFNwYWNlbWl0KFIpIFg2MAo+ID4gTm8gY2hhbmdlczoKPiA+IDYuNzcsIDYu
NzkxLCA2Ljc5MiwgNi44MjYsIDYuNzg0LCA2LjgzOSwgNi43NzYsIDYuNzMzLCA2Ljc5NSwgNi43
NjMKPiA+IEdlb21ldHJpYyBtZWFuOiA2Ljc4NjgzOTMwNQo+ID4gUmV1c2luZyB0aGUgY3VycmVu
dCBzY3JhdGNoOgo+ID4gNy4wODUsIDcuMDksIDcuMDIxLCA3LjA4OSwgNy4wNjgsIDcuMDM0LCA3
LjA2LCA3LjA2MiwgNy4wNjUsIDcuMDUxCj4gPiBHZW9tZXRyaWMgbWVhbjogNy4wNjI0NjY4NzYK
Pgo+IEdyZWF0IHJlc3VsdHMuCj4KPiA+IEEgZGVncmFkYXRpb24gb2YgYXBwcm94aW1hdGVseSA0
LjA2JSBpcyBvYnNlcnZlZC4gVGhlIHBvc3NpYmxlIGNhdXNlCj4gPiBvZiB0aGUgZGVncmFkYXRp
b24gaXMgdGhhdCB0aGUgQ1NSX1RWRUMgcmVnaXN0ZXIgaXMgc2V0IGV2ZXJ5IHRpbWUgYQo+ID4g
a2VybmVsL3VzZXIgZXhjZXB0aW9uIG9jY3Vycy4KPgo+IEkgYXNzdW1lIHRoZSBzYW1lLgo+Cj4g
PiBUaGUgZm9sbG93aW5nIGlzIHRoZSBwYXRjaCB3aXRob3V0IHBlcmNwdSBvcHRpbWl6YXRpb24s
IHdoaWNoIG9ubHkKPiA+IHRlc3RzIHRoZSBvdmVyaGVhZCBvZiBzZXBhcmF0aW5nIGV4Y2VwdGlv
bnMgaW50byBrZXJuZWwgYW5kIHVzZXIKPiA+IG1vZGVzLgo+Cj4gSXMgdGhlIG92ZXJoZWFkIGFi
b3ZlIHdpdGggdGhpcyBwYXRjaD8gIEFuZCB3aGVuIHdlIHRoZW4gdXNlIHRoZQo+IENTUl9TQ1JB
VENIIGZvciBwZXJjcHUsIGRvZXMgaXQgZGVncmFkZSBldmVuIGZ1cnRoZXI/Cj4KPiBUaGFua3Mu
CgoKV2UgY2FuIHNlZSB0aGF0IHRoZSBwZXJjcHUgb3B0aW1pemF0aW9uIGlzIGFyb3VuZCAyLjUl
IHRocm91Z2ggdGhlCm1ldGhvZCBvZiBmaXhpbmcgcmVnaXN0ZXJzLCBhbmQgd2UgY2FuIGNvbnNp
ZGVyIHRoYXQgdGhlIHBlcmNwdQpvcHRpbWl6YXRpb24gY2FuIGJyaW5nIGEgMi41JSBnYWluLiBJ
cyB0aGVyZSBubyBuZWVkIHRvIGFkZCB0aGUgcGVyY3B1Cm9wdGltaXphdGlvbiBsb2dpYyBvbiB0
aGUgYmFzaXMgb2YgdGhlIHNjcmF0Y2ggcGF0Y2ggZm9yIHRlc3Rpbmc/CgpSZWZlcmVuY2U6IGh0
dHBzOi8vbGlzdHMucmlzY3Yub3JnL2cvdGVjaC1wcml2aWxlZ2VkL21lc3NhZ2UvMjQ4NQoKClRo
YW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
