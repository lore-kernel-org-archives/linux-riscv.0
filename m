Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4B8C36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 12:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cqMVmC/xfGS1V+BoX9YfH877eGuaes5ITd5Cu/qXWeY=; b=acC7xZ+cxvrpLu
	B1V3/WX00Wd5cspXitnCNA/AnZ7vE8g6PJwnHPaYqYJT41YgeLY91159HnIR6AoPt7ZM89ms+3EJT
	EW8OzTTlMJQf4LJKaWMHcFiHcSbhKID2UGFfCrpZ+YWDPNj9lOB5cfuk0Ur8gpa/k2Oe1dm0rdOps
	JwJx+DXGxHC0M6YtGi+E5/MirfbvEnsLFlJtn/RXhvzanBlhetLec+rrT/fkOieWlV+2iby70NdNi
	iWCjWcqsK0XdAxYhS/fItVFXhYpF7GFdlBf0wqSeD4hlSlHxq7AroGekJKL/vyDITV7oMaRVdDn2/
	0BRudx0Oh9zksczjLsPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3D5t-0000000DfQj-2sdf;
	Fri, 11 Apr 2025 12:02:49 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3D5g-0000000DfN2-2gPb
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 12:02:38 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-549946c5346so2220878e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 05:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744372954; x=1744977754; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GTjbhTQPyiG7xqaQ8UvxUgMzU1fT+plNfKHQKxJGeGA=;
        b=2wzRLN6GFcGikSDXL5F2XRMk0sWPqDTLrYSeJD9zfNpga1quVZke7Snxi7PIVIc8/I
         OYMoLIOC/2ney+4/tWz7GhoRC8AWOrmq4C0C3FVp/qDmoXbcUaxzJWiN+b1d5gWg2Cbu
         VhC87lGyhJ6fnqknnCdvNZTmFERMtxfRf9K8N3i6/dXaQCTAcczb8IGo7rxvQFBw5lW+
         vUg8hLfRglPgxjtXtn2MRbXXaDH3+yL/dtCCNrEa8SPSHVLLJe/bna63OVqC2AnQX+up
         coR/deFC/BSYZ0KWjIXG8Gak9lPybySPslk5ZhcxH1y1JpKU5yEcNHtpyyT7ns6XebOG
         nbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744372954; x=1744977754;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GTjbhTQPyiG7xqaQ8UvxUgMzU1fT+plNfKHQKxJGeGA=;
        b=eVyuALyOvAvjjtwc+aK4VKfFf/yC+T/15euToekMXXZbYNSmNgrHNLAEzhH120sTtn
         Rszb0BMbg/20mB/B/Vosj7Hftip7scoKuiDaQTqA70htG7LkJ4I/K4DexQHaQwDqEwd3
         0zHIVEWhXbuH6cp+aA+9kNjz+efxkFiFxxaXc5ny1Pd4kQxTQczW69BuKnVlueIM+0U5
         i65MtziIC7NuCZ4Qkirqunxs+8DvxZrAQzB00Ij9SfvvTB+gCWKmACPf52bO7GFRhEuV
         2Go8yU14QBVgDburE9K8XKWp2OT6Vktev49ZrP6777J9ClgSgWsRClzU99e8VCMLjSnN
         /YmA==
X-Forwarded-Encrypted: i=1; AJvYcCUwTtN93lrNQbTV3DR7x0RLfYoMoi7+AEP/laYgqwL0YyaVg4NYRhN2r+gYvuqnR3wtxVpzPEtnkFGQUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiQ/Q26ZJ4MutdG+Q34uryVOufyGU9BCw0TD79UOpW/GaAiRYW
	+YKDrx0suPUTqt2AFT398SicRoxsjiN4q4pKZwUwiz/L/Qkpmwi56jkXR/eCrNQ=
X-Gm-Gg: ASbGncuF5hdHQcwNLuuLhz6EXxCeuaexqMkfT+B4HircCxfOTwnjxlh8wo+/TLxCTFw
	cGPnBqxKPvKPdqtIsDVg66BJHN/xhrpp7m1J1tNGOR3WEVU8I82ERndfzbLwulINVD0TS8bEqjL
	t2V2XqjMLNdWZnlo1iOXdZLnPec59SQfST1z2ciRdh/QoOVcIbIRSO1EkDFDX8S+cM/nx05Y2nG
	4srnZXgLXkykRt97uA3RR/j+FBGbo0P/wc2fGSxr3uW8h7ZrwSeCTjExejA2hx2Cb+pHlBoTdll
	I1VZH51M/rDeu/RQpoCLIv5ScznAOWuHoY81znuZ6zCpNVUvCWSxE7W3G6XX6bqfvmo8e626iZO
	9BFnFBH+8frX7dxNdXgIZWZ0=
X-Google-Smtp-Source: AGHT+IGfFmPQWZYnO10E+LYxQvnTjU0ALMUCd5lFZj8/A33H6zh0WNsaVqCNcFxy/TNaTN0/VfoLsw==
X-Received: by 2002:a05:6512:138e:b0:545:2871:7cd5 with SMTP id 2adb3069b0e04-54d45292cb9mr784659e87.15.1744372953520;
        Fri, 11 Apr 2025 05:02:33 -0700 (PDT)
Received: from h-2001-9b1-c3c7-e600-116c-cc53-dd4f-4ae1.na.bahnhof.se ([2001:9b1:c3c7:e600:116c:cc53:dd4f:4ae1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d238d80sm414653e87.71.2025.04.11.05.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:02:32 -0700 (PDT)
Message-ID: <47286334f978e1a9e19efa6fd3af3d06de863080.camel@rivosinc.com>
Subject: Re: [PATCH v4 12/12] riscv: Documentation: add a description about
 dynamic ftrace
From: Robbin Ehn <rehn@rivosinc.com>
To: Andy Chiu <andybnac@gmail.com>, linux-riscv@lists.infradead.org, 
	alexghiti@rivosinc.com, palmer@dabbelt.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Ghiti
	 <alex@ghiti.fr>, bjorn@rivosinc.com, puranjay12@gmail.com, 
	paul.walmsley@sifive.com, greentime.hu@sifive.com, nick.hu@sifive.com, 
	nylon.chen@sifive.com, eric.lin@sifive.com, vicent.chen@sifive.com, 
	zong.li@sifive.com, yongxuan.wang@sifive.com, samuel.holland@sifive.com, 
	olivia.chu@sifive.com, c2232430@gmail.com
Date: Fri, 11 Apr 2025 14:02:30 +0200
In-Reply-To: <20250407180838.42877-12-andybnac@gmail.com>
References: <20250407180838.42877-1-andybnac@gmail.com>
	 <20250407180838.42877-12-andybnac@gmail.com>
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_050236_874612_BE03C369 
X-CRM114-Status: GOOD (  15.29  )
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

SGksIHRoYW5rcywKCnMvYXRtb2ljL2F0b21pYwoKT24gVHVlLCAyMDI1LTA0LTA4IGF0IDAyOjA4
ICswODAwLCBBbmR5IENoaXUgd3JvdGU6Cj4gK3dpdGhvdXQgYSByYWNlIGNvbmRpdGlvbi4gVGhp
cyBzZXJpZXMgbWFrZXMgYXRtb2ljIGNvZGUgcGF0Y2hpbmcgcG9zc2libGUgaW4KLi4uCj4gK3Nl
dHRpbmcgdGhlIGZpcnN0IGluc3RydWN0aW9uIHRvIEFVSVBDLCBhbmQgdGhlIHNlY29uZCB0byBO
T1AuIE5vdywgYXRtb2ljCgovUm9iYmluCgo+ICtwYXRjaGluZyBpcyBwb3NzaWJsZSBiZWNhdXNl
IHRoZSBrZXJuZWwgb25seSBoYXMgdG8gdXBkYXRlIG9uZSBpbnN0cnVjdGlvbi4KPiArQWNjb3Jk
aW5nIHRvIFppY2NpZiwgYXMgbG9uZyBhcyBhbiBpbnN0cnVjdGlvbiBpcyBuYXR1cmFsbHkgYWxp
Z25lZCwgdGhlIElTQQo+ICtndWFyYW50ZWUgYW7CoCBhdG9taWMgdXBkYXRlLgo+ICsKPiArQnkg
Zml4aW5nIGRvd24gdGhlIGZpcnN0IGluc3RydWN0aW9uLCBBVUlQQywgdGhlIHJhbmdlIG9mIHRo
ZSBmdHJhY2UKPiB0cmFtcG9saW5lCj4gK2lzIGxpbWl0ZWQgdG8gKy0ySyBmcm9tIHRoZSBwcmVk
ZXRlcm1pbmVkIHRhcmdldCwgZnRyYWNlX2NhbGxlciwgZHVlIHRvIHRoZQo+IGxhY2sKPiArb2Yg
aW1tZWRpYXRlIGVuY29kaW5nIHNwYWNlIGluIFJJU0MtVi4gVG8gYWRkcmVzcyB0aGUgaXNzdWUs
IHdlIGludHJvZHVjZQo+ICtDQUxMX09QUywgd2hlcmUgYW4gOEIgbmF0dXJhbGx5IGFsaWduIG1l
dGFkYXRhIGlzIGFkZGVkIGluIGZyb250IG9mIGVhY2gKPiArcGFjdGhhYmxlIGZ1bmN0aW9uLiBU
aGUgbWV0YWRhdGEgaXMgcmVzb2x2ZWQgYXQgdGhlIGZpcnN0IHRyYW1wb2xpbmUsIHRoZW4KPiB0
aGUKPiArZXhlY3V0aW9uIGNhbiBiZSBkZXJlY3QgdG8gYW5vdGhlciBjdXN0b20gdHJhbXBvbGlu
ZS4KPiArCj4gK0NNT0RYIGluIHRoZSBVc2VyIFNwYWNlCj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+ICsKPiArVGhvdWdoIGZlbmNlLmkgaXMgYW4gdW5wcml2aWxlZ2VkIGluc3RydWN0aW9uLCB0
aGUgZGVmYXVsdCBMaW51eCBBQkkKPiBwcm9oaWJpdHMKPiArdGhlIHVzZSBvZiBmZW5jZS5pIGlu
IHVzZXJzcGFjZSBhcHBsaWNhdGlvbnMuIEF0IGFueSBwb2ludCB0aGUgc2NoZWR1bGVyIG1heQo+
ICttaWdyYXRlIGEgdGFzayBvbnRvIGEgbmV3IGhhcnQuIElmIG1pZ3JhdGlvbiBvY2N1cnMgYWZ0
ZXIgdGhlIHVzZXJzcGFjZQo+ICtzeW5jaHJvbml6ZWQgdGhlIGljYWNoZSBhbmQgaW5zdHJ1Y3Rp
b24gc3RvcmFnZSB3aXRoIGZlbmNlLmksIHRoZSBpY2FjaGUgb24KPiB0aGUKPiArbmV3IGhhcnQg
d2lsbCBubyBsb25nZXIgYmUgY2xlYW4uIFRoaXMgaXMgZHVlIHRvIHRoZSBiZWhhdmlvciBvZiBm
ZW5jZS5pIG9ubHkKPiArYWZmZWN0aW5nIHRoZSBoYXJ0IHRoYXQgaXQgaXMgY2FsbGVkIG9uLiBU
aHVzLCB0aGUgaGFydCB0aGF0IHRoZSB0YXNrIGhhcwo+IGJlZW4KPiArbWlncmF0ZWQgdG8gbWF5
IG5vdCBoYXZlIHN5bmNocm9uaXplZCBpbnN0cnVjdGlvbiBzdG9yYWdlIGFuZCBpY2FjaGUuCj4g
wqAKPiDCoFRoZXJlIGFyZSB0d28gd2F5cyB0byBzb2x2ZSB0aGlzIHByb2JsZW06IHVzZSB0aGUg
cmlzY3ZfZmx1c2hfaWNhY2hlKCkKPiBzeXNjYWxsLAo+IMKgb3IgdXNlIHRoZSBgYFBSX1JJU0NW
X1NFVF9JQ0FDSEVfRkxVU0hfQ1RYYGAgcHJjdGwoKSBhbmQgZW1pdCBmZW5jZS5pIGluCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
