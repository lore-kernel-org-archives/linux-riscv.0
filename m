Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3297ED3B7E2
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Dec 2025 20:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxf4zm1EDuU+vt/a9QicQ3IyNlbX5e/It/XWpwShcT0=; b=Rf0kCps0hfP31l
	zvn2kaOYOPbu4WXwVbtAxGsNl6JKtD3+5I+YlhaY3X4aIJSe+wPTDunWEpMMq3FhQveflJkacd2oo
	of0HACWry+wsHhf/O3h53k5iV/E7eFwFaxSDcRIbBBBPKT6UmMe508xuqNuyiMQBZmSfp7t7DhoBP
	35tuwKSFo0qevbh7oCBvEW4os7PA9jdiC9jm16GK2d4mPnO4mvvKO0ZMlP0q4d/Onu1gyp3PRlAY4
	K0uq+ZNj96blv2Y0bBBjdzt/y0Iu8uIWcRmZ4fFmuDnVX+xZ+4DB0v5mM17fDTajfDM95pnkIIKSy
	XKcjCyG/HHpyCt0dehPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vShxj-0000000DWN3-0xpo;
	Mon, 08 Dec 2025 20:36:03 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vShxg-0000000DWMh-1aHH
	for linux-riscv@lists.infradead.org;
	Mon, 08 Dec 2025 20:36:01 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-59583505988so6021340e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 Dec 2025 12:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765226158; x=1765830958; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3D5kD500HpmwSprzmfQML5Kvc15a25K3Hzfpzmghy+0=;
        b=Q+xp2FE+pxTB6vKJwQA/JqvF1je6Srv41UfpL2ve6shh5no72g+HDvSLVfhrerBA/L
         5qZ8Jsgi+rtdzaRakzdqx8cZ5FGmHa8HWGrfL5jucVdMpZlkXsXqahLsADVElB8T/+Cl
         L0Ae5teEw7sktweTJLao3/1wh1a/c0BvnKjhYqMJvS7mIMYhynvRYM7VU0BpuBCHPw3E
         iv1nfgjjn1vYziWkyAFFxeFxYqILquPF4YCu1cNwjZtJWXmEYxtRTllkj49RFC98kbbu
         OYJzvnLHzf0RdMcEZ3WmRtj9O1JfzdP9of8ZgJQxRowtz2vqKb2VuE7JRFoL/Bh102Ae
         RpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765226158; x=1765830958;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3D5kD500HpmwSprzmfQML5Kvc15a25K3Hzfpzmghy+0=;
        b=NvqPeaJbubRMpVwYYrJ8BwqZt5nEuaGhw7aZa/ihi7Rg0RssD3ro2Q5E54Jlxmj+K/
         BtjMSACiXLwZ2J/9cBSLj9gG9zu/TvQ25dgXBD7gxQ3BDFRLv3LzckXrRU0XwBAlW42M
         ZtYG2W69tz67HU7xNmD+eLM7gUwpzpKO/xOT0LZ6+BEzv0/olN2FnqO40YaIymSy0ICY
         phh0nPC6//Msp/zGzWNs1QaUly+EeY/TewVpA3djO6FPNqyLueO3XOUudvh+wZD5Zjta
         wxlPET773j8Zb1T32F74V+nivKrIirBhUqp4PDH0JacqfHvMwN4FAW+5bAD2Ylo+8n66
         wsgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfZgjtJbTcFcbb4lHOgPmp5XCf9lNpHfpnaZq35a+EqY2ZzEFgZYsFPH1ZOnbcrjy27o9Vyxz2WlB+Ag==@lists.infradead.org
X-Gm-Message-State: AOJu0YxINX8oc+2qA+PezuNuywfqrZ8jPOxmnhm9ucc3jxUZgPI/n5rb
	NttU92P0GFTtiHOT8wlbCFoPeK3QqH41vh9keh9FKLLl7Od3y4aOoQEy
X-Gm-Gg: ASbGncutl3Bj0tcdxOZ1FClaRtv2uXsqjL/pHmQSni0hcP3WbjD/lcj/s3MY1X0xpPl
	SD9Olg1HvWTLBxVD3a92o9CBiLqVI1VixppjZUrl7HNDYyNtU6jalRnfKLYr5KZD9ObC2c2hOj5
	q9lerNr/3I9NPmyVh9UvF12EZnaU/zjq/LKy3AXHDdhnwq8T2Shy+bWcRTRu9k1dcvOyqULihWW
	EQRKehQhw0UmUhK9/GKztW3VtzBOzB+W5EShKLEnY1aYD4xOShK/quUHl65R2dq/XaDDWACbCDu
	Hw7NQR84RgzUUG/pKhBfrOcNNrVCJOwNY8gaRzvUimwxYGhcchFMhvaHyg9Nh+73KHmRPv1IRDG
	1E2Awprb9e+jaE7BAV6kX/momuIG4OVFNySoPf+WRvQoiNrLwV7/9PbJpINg9OES+9ii68bqc0Y
	0fMQ==
X-Google-Smtp-Source: AGHT+IFxD46idyml5mDZecUPUQulSu8KqgMNNDpyRDJrIw18BS9ui+72Y8Bk2CtnjeAWlIFclHhKVw==
X-Received: by 2002:ac2:51d5:0:b0:595:90ce:df8e with SMTP id 2adb3069b0e04-598e92ac83fmr187477e87.5.1765226157327;
        Mon, 08 Dec 2025 12:35:57 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b1a7dbsm4400878e87.20.2025.12.08.12.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 12:35:56 -0800 (PST)
Date: Mon, 8 Dec 2025 23:35:53 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Andy Chiu <andybnac@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: hwprobe: expose vector register length in bytes
Message-ID: <aTc2qaf6JxBPLvtH@curiosity>
References: <20251121193524.1813200-1-geomatsi@gmail.com>
 <CAFTtA3NVd8HMomd60i=T_S34TSL18==aYRFhg2AH-PbsM=hggw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFTtA3NVd8HMomd60i=T_S34TSL18==aYRFhg2AH-PbsM=hggw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_123600_473892_734E26C3 
X-CRM114-Status: GOOD (  25.20  )
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

SGkgQW5keQoKT24gV2VkLCBEZWMgMDMsIDIwMjUgYXQgMTE6NTc6MDZBTSAtMDYwMCwgQW5keSBD
aGl1IHdyb3RlOgo+IEhpIFNlcmdleSwKPiAKPiBPbiBGcmksIE5vdiAyMSwgMjAyNSBhdCAxOjM3
4oCvUE0gU2VyZ2V5IE1hdHl1a2V2aWNoIDxnZW9tYXRzaUBnbWFpbC5jb20+IHdyb3RlOgo+ID4K
PiA+IFRoZSB2ZWN0b3IgcmVnaXN0ZXIgbGVuZ3RoIGNhbiBiZSBvYnRhaW5lZCBmcm9tIHRoZSBy
ZWFkLW9ubHkgQ1NSIHZsZW5iLgo+ID4gSG93ZXZlciByZWFkaW5nIHRoaXMgQ1NSIG1heSBiZSB1
bmRlc2lyYWJsZSBpbiBzb21lIGNhc2VzLiBYVGhlYWRWZWN0b3IKPiA+IGV4dGVuc2lvbiBpcyBv
bmUgZXhhbXBsZTogZXhpc3RpbmcgaW1wbGVtZW50YXRpb25zIG1heSBub3QgcHJvdmlkZSB0aGlz
Cj4gPiByZWdpc3Rlci4gT24gc3VjaCBwbGF0Zm9ybXMsIHZsZW5iIGlzIHNwZWNpZmllZCBhcyBk
ZXZpY2UtdHJlZSBwcm9wZXJ0eS4KPiAKPiBJIHdvbmRlciB3aHkgYSBod3Byb2JlIGVudHJ5IGlz
IG5lZWRlZCBldmVuIGluIHRoaXMgY29udGV4dC4gSWYgdmxlbmIKPiBpcyBub3QgYXZhaWxhYmxl
LCB3ZSBjYW4gYWx3YXlzIHVzZSBhIHZzZXR2bGkgYW5kIHJlYWQgdGhlIGRlc3RpbmF0aW9uCj4g
cmVnaXN0ZXIgdG8gaW5mZXIgcmVnaXN0ZXIgbGVuZ3RoLiBJc24ndCB0aGF0IGFsc28gdHJ1ZSBm
b3IgVmVjdG9yCj4gMC43LCBvciBhcmUgeW91IGNvbnNpZGVyaW5nIGFueXRoaW5nIGVsc2U/CgpT
dXJlLCByZWFkaW5nIHZzZXR2bGkgd29ya3MgZm9yIFhUaGVhZFZlY3RvciBhcyB3ZWxsLiBUaGUg
cHJpbWFyeSByZWFzb24KZm9yIHRoZSBuZXcgaHdwcm9iZSBrZXkgaXMgY29udmVuaWVuY2UuIFZl
Y3RvciAxLjAgYW5kIFhUaGVhZFZlY3RvciBoYXZlCnNvbWUgZGlmZmVyZW5jZXMgdGhhdCBjb21w
bGljYXRlIHRoYXQgc29ydCBvZiBhdXRvZGV0ZWN0aW9uLiBGb3IgaW5zdGFuY2UsCmFuIG9sZGVy
IGVuY29kaW5nIGZvciB2c2V0dmxpLiBHb29kIGV4YW1wbGVzIGFyZSB2c3RhdGUgc2F2ZSBhbmQg
cmVzdG9yZQpmdW5jdGlvbnMgaW4gYGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmhgLiBV
c2luZyBod3Byb2JlIHNlZW1zIG1vcmUKY29udmVuaWVudCB0aGFuIHVzaW5nIHZlY3Rvci1vci14
dGhlYWR2ZWN0b3IgbG9naWMgd2l0aCBjdXN0b20gb3Bjb2RzLAplc3BlY2lhbGx5IHNpbmNlIHRo
ZSBrZXJuZWwgYWxyZWFkeSBoYXMgYWxsIHRoZSBuZWNlc3NhcnkgaW5mb3JtYXRpb24uCgo+ID4g
UmVhZGluZyB2bGVuYiBhbHNvIGluaXRpYWxpemVzIHRoZSBhcHBsaWNhdGlvbuKAmXMgdmVjdG9y
IGNvbnRleHQsIGV2ZW4KPiA+IHRob3VnaCB0aGUgYXBwbGljYXRpb24gbWF5IGRlY2lkZSBub3Qg
dG8gdXNlIHRoZSB2ZWN0b3IgZXh0ZW5zaW9uIGJhc2VkCj4gPiBvbiB0aGUgcmVwb3J0ZWQgbGVu
Z3RoLgo+ID4KPiA+IE1lYW53aGlsZSB0aGUga2VybmVsIGFscmVhZHkgZGV0ZXJtaW5lcyB2bGVu
YiBhdCBib290LCBlaXRoZXIgZnJvbSB0aGUKPiA+IENTUiBvciBmcm9tIHRoZSBkZXZpY2UgdHJl
ZS4gU28gYWRkIFJJU0NWX0hXUFJPQkVfS0VZX1ZFQ1RPUl9SRUdfTEVOR1RICj4gPiB0byBleHBv
c2UgdGhlIHZlY3RvciByZWdpc3RlciBsZW5ndGggYWxyZWFkeSBrbm93biB0byB0aGUga2VybmVs
Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBNYXR5dWtldmljaCA8Z2VvbWF0c2lAZ21h
aWwuY29tPgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0
ICB8IDMgKysrCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmggICAgICB8IDIg
Ky0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMSArCj4gPiAg
YXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICB8IDYgKysrKysrCj4gPiAgNCBm
aWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpbc25pcF0uLi4K
Cj4gVGhhbmtzLAo+IEFuZHkKClJlZ2FyZHMsClNlcmdleQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
