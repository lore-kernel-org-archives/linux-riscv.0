Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EF3CA1009
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 12:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cbx+ykTyfDhUDCruiUCv4Rjt6DO3BD+P4g+2hHZmqRY=; b=jiWjvz89sBV1Kd
	761mKKCMkdSdkBirbxoA0DlxzQaeH6UlSVd17RU5l/Ui2RFFABlTq5I7m6jySy48ZQDxm7RwBAPV5
	JN7RhH98UFW05w+dAfCF0OpzEfHWM2UXxuXWk2lmhpulaszXX6Qy0h2RUGaw250uOHlASN7vQcI6w
	NEgOmjMHND7pBe9TqrxnX5ZfPb8R+Oo+uehjqFk/t0cI6tM9tGaW0aa8/hapl7GeQU6LocAlOnUoQ
	NtgpO0rWPcWPA1webiWmm5QejQ+3UTpBshfq83Qct8MkMSdxwrMn6AVDkU8gRE/j6ZFdHtqe6ufVR
	pX5cZZpsrdB4fBtGv9Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmqQ-00000006R1N-37xO;
	Wed, 03 Sep 2025 12:44:10 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlsR-00000006Fs3-3rts
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 11:42:13 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-32b5d8bea85so659124a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Sep 2025 04:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756899728; x=1757504528; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ft7a1y38TQmqSZ+GiWBdbP1PqNWAejf1LfumBwWdqBM=;
        b=DRdA9l5ldEEKmbjO3y0C/u3FZzIRu7pQP7tZhhRc3usKKn8kuEnpTW67cj965OwPvR
         x8LyNr2V7shtDmSi+HyuHKCK/TsD9MN4oWvYD/qb0SL7mswYW9Ekg8qsSURg1lLeLmLw
         99S/YChVRbz32+k3kU+3kPQ3DJugqUXaCy8lPlijtL+4S6vJgkih2fJziw1sw1S9leQ5
         qOauvTG1bgiu7GaRuNKKP3v7gF92DpCni6MA/cQmUKG1KU5aS5MoboWrwtGSvlrzEVHd
         +cZfdL5XX3bpm/iFU0aA24JGixcR3sn3QXEe+krezc2Gy67nWxfEviLThV4lRBxcpLDS
         m2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756899728; x=1757504528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ft7a1y38TQmqSZ+GiWBdbP1PqNWAejf1LfumBwWdqBM=;
        b=cIJKQzYcKSH67jJV05kikekp+nRibps1OSYKpPrDScj/XQUZc+64xQUMTUqSYSauIf
         51XuK9xak0T50GN0vprB99WlvTjxVveLsER44FGPxLfARBTWh/TP1voBAeh6vtxw8LQw
         LxViMQycbXR9luqLsBpAu2nF1svonxlqUgNlkuOJvpD40B7u1D90IXMPr80lWAROgqI9
         /olUPtrShupmrpA9tgtf0B/YhOWqaECsTI94ebQKslhTbF5ponGgWuMdrDyw66ePMHGf
         43gUFcgRaP7sa6kKBMnMPaWBoIjWwHCX/ZE8tT8Qr0Q334OO4WgfyarbLcL3NlMoRlSU
         lGXg==
X-Forwarded-Encrypted: i=1; AJvYcCWeKAhxCtygykykP8sI1YoueOqE0d/ky8Bha5X8l7Z68ARFAhWaqkENFa+LK5bYHdIhH+dvcfawLg6TzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAbPMNllxaG8gEZKFevodSnQJVAOKKCqFdptdmRRXHpzOzMAEU
	ER/xSbQpLE2LOkugpaJEIkPTUHO1ae8a/W4SY/BrdTPSTNDGOIapdQ1a3jg4tGwbeBB3ezFX1v4
	4KJ/8iGj7348vyKl8ARyYFWX4VFIX2ggmbthVxMDcAQ==
X-Gm-Gg: ASbGncvKcIT6pufuHQnUlJi1DdOtXoUpW/YELpDI/jZUUB164AP8OTw5Gs5LPg+2EuX
	3nJx5zsGK7vLZc3lEwj10kTTGJFjhHEn2t1lE0WtDReWl/j4LBRF5YpTejJxa9Cs+QRaUyvKzF9
	sUBjLZ5duSapuep5P2QmQ/0TaUAAQjp9SxYcPqzaQBYBCL/fCFsR/iM2Kk6RqDm5DJLx3mL/iXX
	rJ4O9gpEkQi8muDM9W8+0ZKIly0X373GNC/XXVGrgUCeAedV0utcYwbiys=
X-Google-Smtp-Source: AGHT+IFtJbKlmEkW5GGySvPf1/HOA+JVG5Zy6u8Y+RfeMdmIZ6i1j+zUKLBeK7ONCJdCDpwadOW6zM4NzlV/gKsIpD0=
X-Received: by 2002:a17:90b:4e88:b0:31c:39c2:b027 with SMTP id
 98e67ed59e1d1-32815438312mr20559057a91.7.1756899728089; Wed, 03 Sep 2025
 04:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250902042432.78960-1-luxu.kernel@bytedance.com> <aLciY2putG8g2P9F@andrea>
In-Reply-To: <aLciY2putG8g2P9F@andrea>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Wed, 3 Sep 2025 19:41:57 +0800
X-Gm-Features: Ac12FXyU8EgKWXBaEJy_wfubw9BJFW5J8dcyAUN_yKwbpnfcVBbrt6BJ6erPgkA
Message-ID: <CAPYmKFvLSri1-PKSHfgG03w3zLbp9w2FaY7v5-jM__LufqPf2Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 0/4] riscv: Add Zalasr ISA extension support
To: Andrea Parri <parri.andrea@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, ajones@ventanamicro.com, brs@rivosinc.com, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_044211_963312_6A7BFB26 
X-CRM114-Status: GOOD (  17.18  )
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

SGkgQW5kcmVhLAoKR3JlYXQgY2F0Y2ghIFRoYW5rcyBhIGxvdCBmb3IgeW91ciByZXZpZXcuCgpU
aGUgcHJvYmxlbSBjb21lcyBmcm9tIHRoZSBtaXhlZCB1c2Ugb2YgYWNxdWlyZS9yZWxlYXNlIHNl
bWFudGljcyB2aWEKZmVuY2UgYW5kIHZpYSByZWFsIGxkLmFxL3NkLnJsLiBJIHdvdWxkIHByZWZl
ciB5b3VyIG1ldGhvZCAoYSkuIFRoZQpleGlzdGluZyBhdG9taWMgYWNxdWlyZS9yZWxlYXNlIGZ1
bmN0aW9ucycgaW1wbGVtZW50YXRpb24gY2FuIGJlCmZ1cnRoZXIgbW9kaWZpZWQgdG8gYW1vY2Fz
LnNxL2Ftb2Nhcy5ybC9sci5hcS9zYy5ybC4gSSB3aWxsIHNlbmQgdGhlCm5leHQgdmVyc2lvbiBh
ZnRlciBJIGZpbmlzaCBpdCBhbmQgaG9wZSB5b3UgY2FuIGhlbHAgd2l0aCByZXZpZXcgdGhlbi4K
CkJlc3QgcmVnYXJkcywKWHUgTHUKCk9uIFdlZCwgU2VwIDMsIDIwMjUgYXQgMTI6NTnigK9BTSBB
bmRyZWEgUGFycmkgPHBhcnJpLmFuZHJlYUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBYdSBMdSAo
NCk6Cj4gPiAgIHJpc2N2OiBhZGQgSVNBIGV4dGVuc2lvbiBwYXJzaW5nIGZvciBaYWxhc3IKPiA+
ICAgZHQtYmluZGluZ3M6IHJpc2N2OiBBZGQgWmFsYXNyIElTQSBleHRlbnNpb24gZGVzY3JpcHRp
b24KPiA+ICAgcmlzY3Y6IEluc3Ryb2R1Y2UgWmFsYXNyIGluc3RydWN0aW9ucwo+ID4gICByaXNj
djogVXNlIFphbGFzciBmb3Igc21wX2xvYWRfYWNxdWlyZS9zbXBfc3RvcmVfcmVsZWFzZQo+Cj4g
SW5mb3JtYWxseSBwdXQsIG91ciAoTGludXgpIG1lbW9yeSBjb25zaXN0ZW5jeSBtb2RlbCBzcGVj
aWZpZXMgdGhhdCBhbnkKPiBzZXF1ZW5jZQo+Cj4gICBzcGluX3VubG9jayhzKTsKPiAgIHNwaW5f
bG9jayh0KTsKPgo+IGJlaGF2ZXMgImFzIGl0IHByb3ZpZGVzIGF0IGxlYXN0IEZFTkNFLlRTTyBv
cmRlcmluZyBiZXR3ZWVuIG9wZXJhdGlvbnMKPiB3aGljaCBwcmVjZWRlIHRoZSBVTkxPQ0srTE9D
SyBzZXF1ZW5jZSBhbmQgb3BlcmF0aW9ucyB3aGljaCBmb2xsb3cgdGhlCj4gc2VxdWVuY2UiLiAg
VW5sZXNzIEkgbWlzc2luZyBzb21ldGhpbmcsIHRoZSBwYXRjaCBzZXQgaW4gcXVlc3Rpb24gYnJl
YWtzCj4gc3VjaCBvcmRlcmluZyBwcm9wZXJ0eSAob24gUklTQy1WKTogZm9yIGV4YW1wbGUsIGEg
InJlbGVhc2UiIGFubm90YXRpb24sCj4gLlJMIChhcyBpbiBzcGluX3VubG9jaygpIC0+IHNtcF9z
dG9yZV9yZWxlYXNlKCksIGFmdGVyIHBhdGNoICM0KSBwYWlyZWQKPiB3aXRoIGFuICJhY3F1aXJl
IiBmZW5jZSwgRkVOQ0UgUixSVyAoYXMgY291bGQgYmUgZm91bmQgaW4gc3Bpbl9sb2NrKCkgLT4K
PiBhdG9taWNfdHJ5X2NtcHhjaGdfYWNxdWlyZSgpKSBkbyBub3QgcHJvdmlkZSB0aGUgc3BlY2lm
aWVkIHByb3BlcnR5Lgo+Cj4gSSBfdGhpbmsgc29tZSBzb2x1dGlvbnMgdG8gdGhlIGlzc3VlIGFi
b3ZlIGluY2x1ZGU6Cj4KPiAgYSkgbWFrZSBzdXJlIGFuIC5STCBhbm5vdGF0aW9uIGlzIGFsd2F5
cyBwYWlyZWQgd2l0aCBhbiAuQVEgYW5ub3RhdGlvbgo+ICAgICBhbmQgdmljZXZlcnNhIGFuIC5B
USBhbm5vdGF0aW9uIGlzIHBhaXJlZCB3aXRoIGFuIC5STCBhbm5vdGF0aW9uCj4gICAgICh0aGlz
IGFwcHJvYWNoIG1hdGNoZXMgdGhlIGN1cnJlbnQgYXJtNjQgYXBwcm9hY2gvaW1wbGVtZW50YXRp
b24pOwo+Cj4gIGIpIG9uIHRoZSBvcHBvc2l0ZSBkaXJlY3Rpb24sIGFsd2F5cyBwYWlyIEZFTkNF
IFIsUlcgKG9yIG9jY2FzaW9uYWxseQo+ICAgICBGRU5DRSBSLFIpIHdpdGggRkVOQ0UgUlcsVyAo
dGhpcyBtYXRjaGVzIHRoZSBjdXJyZW50IGFwcHJvYWNoL3RoZQo+ICAgICBjdXJyZW50IGltcGxl
bWVudGF0aW9uIHdpdGhpbiByaXNjdik7Cj4KPiAgYykgbWl4IHRoZSBwcmV2aW91cyB0d28gc29s
dXRpb25zIChyZXNwLiwgYW5ub3RhdGlvbnMgYW5kIGZlbmNlcyksIGJ1dAo+ICAgICBtYWtlIHN1
cmUgdG8gInVwZ3JhZGUiIGFueSByZWxlYXNlcyB0byBwcm92aWRlIChpbnNlcnQpIGEgRkVOQ0Uu
VFNPLgo+Cj4gKGEpIHdvdWxkIGFsaWduIFJJU0MtViBhbmQgQVJNNjQgKHdoaWNoIGlzIGEgZ29v
ZCB0aGluZyBJTU8pLCB0aG91Z2ggaXQKPiBpcyBwcm9iYWJseSB0aGUgbW9zdCBpbnZhc2l2ZSBh
cHByb2FjaCBhbW9uZyB0aGUgdGhyZWUgYXBwcm9hY2hlcyBhYm92ZQo+IChyZXF1aXJpbmcgY2Vy
dGFpbiBjaGFuZ2VzIHRvIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20ve2NtcHhjaGcsYXRvbWljfS5o
LAo+IHdoaWNoIGFyZSBhbHJlYWR5IHJlbGF0aXZlbHkgbWVzc3kgZHVlIHRvIHRoZSB2YXJpb3Vz
IFpBQkhBIHBsdXMgWkFDQVMKPiBzd2l0Y2hlcykuICBPdmVyYWxsLCBJJ20gbm90IHRvbyBleGl0
ZWQgYXQgdGhlIGlkZWEgb2YgcmV2aWV3aW5nIGFueSBvZgo+IHRob3NlIGNoYW5nZXMsIGJ1dCBp
ZiB0aGUgY29tbXVuaXR5IG9wdHMgZm9yIGl0LCBJJ2xsIGFsbW9zdCBkZWZpbml0ZWx5Cj4gdGFr
ZSBhIGNsb3NlciBsb29rIHdpdGggZHVlIGNhbG0uICA7LSkKPgo+ICAgQW5kcmVhCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
