Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC80C47077
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 15:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=1IjLGY17TlaugQRAoeMx7eKBW6BWrk84kedw5w4KKrc=; b=mzMSjn5ZnU+yoyJQULtXtVTNpH
	5oq+1HGkIsBO2Ch1TuZBLLwzmLrXkxCz7fNY+Qm/zhn/cNyIZBgnLKjNhjQoSyPZLvfJGGHZui/Rr
	+jAs3qDr9/pcpW0HtrOULXDsIp1AGPCQbr8Afvl1ZOMHF24tG+5pD0DGNTQjm/TJp1VInu1X/Cd9h
	gYkbrY4b/FIvbtLame4ZC80cnGdCM1MVOLaw8REl1rbXkDGa6lwqLbp+topoFYSc4mmAkfLaubd9a
	oPD33ySKqTMn2DYxYmO/GBz2X57l5G+RZbCMm3EbXG1iA+4LvXx2G98CwBQzc+Y6qxGeuqE9JdTS5
	IaZdVykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNx74-000SmO-1A;
	Thu, 11 Jan 2024 15:36:58 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNx70-000SlZ-2J
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 15:36:56 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3bbd6e37af4so4335171b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 07:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1704987411; x=1705592211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDFuvNPB2cG7HqrV8iXyazQ/HuolZ9Qbba8cNo3np68=;
        b=q4iu9sX9LEbH6EecwA8l1bBJ0y3J2gdUNLSUSk1KEVo0RNAgUyYWRGVcgOliUSeFLi
         0Epj3u6U2f77smILeOn0D+nu1S/6uCGnlPCRmpUSO0ZMIpKjPOWHn9q3sBafRjJ+zHMe
         Ng4a82NKBW6P7KG5t1VHC6xEB/bzANjoCGtnIaOguK5GrZFQlQYZTggRSVP9q+pPWu7z
         5N3VnJkBxcNXN0mcn7NqKh8uy2kb6FiHdE5xRAUh8ZKSZRmUjwo7vfxrp/Y+dWzannHq
         JzvOyh+PGp+SWfPxQEZ6uUkY/w9HJfpp1HtylUUuoXq7gMgaRbsVoMOtGR+OLrIImoHU
         s0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704987411; x=1705592211;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDFuvNPB2cG7HqrV8iXyazQ/HuolZ9Qbba8cNo3np68=;
        b=oAfcfHGg2C/aSvvjuUpb20jpDX/8FnGWotvm0JtSNbC6N+AA6Oq5hFYZ8Tk4oXJQ1Z
         eZhzvY89cJt7dGqr22WOZs5IXBB+sa5L9wloi/1FXm+ovI0MAtWuFU5wxSf3bNzn6yiO
         EAYh2Wln4l7r9s1rJFzWyNyCDf/xahqVfSG4NHRAs57j8PDZ6x+S36t+PWFDp83b2/jK
         gqvc/3/EOy3mw+ii5OquCxIrTnIPgTEOtVYZ3UtmURPAyzTrmm3Cv1POV++9MbyLuR3B
         tBPfrAAZPdALpz2x2XRXQ1O85odvloVT/IILT+2sjV9tZPkvtH7diBkz7drVRw292sSK
         VKyQ==
X-Gm-Message-State: AOJu0YxcLpCWeXN5ZANnbHC0ajOPf2M4YUlRX/gjRpntpBtuX+DTkkcc
	EpL+2TOY6mqYCp4zgXwPMM3RtwWaDxJlYg==
X-Google-Smtp-Source: AGHT+IHFGQG4mYWsTOS7Vn8HQB4sQWmCgmeEuSLKMJpaTmMUXTDnnIj8S2m8kVoqKUZ8aAuj+ui98A==
X-Received: by 2002:a05:6808:15a6:b0:3bd:49b0:4364 with SMTP id t38-20020a05680815a600b003bd49b04364mr1675979oiw.95.1704987410996;
        Thu, 11 Jan 2024 07:36:50 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d3-20020a05680813c300b003bc1060d1dbsm192309oiw.57.2024.01.11.07.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 07:36:50 -0800 (PST)
Date: Thu, 11 Jan 2024 07:36:50 -0800 (PST)
X-Google-Original-Date: Thu, 11 Jan 2024 07:36:40 PST (-0800)
Subject: Re: [PATCH] riscv: vector: Check SR_SD before saving vstate
In-Reply-To: <CABgGipX7Jf7M8ZYgeRPcE9tkzc7XWpfWErsiacn2Pa9h=vG2cQ@mail.gmail.com>
CC: patchwork-bot+linux-riscv@kernel.org, songshuaishuai@tinylab.org,
  linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  greentime.hu@sifive.com, Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org,
  Bjorn Topel <bjorn@rivosinc.com>, xiao.w.wang@intel.com, heiko@sntech.de, ruinland.tsai@sifive.com,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andy.chiu@sifive.com
Message-ID: <mhng-089c592d-dc14-4eec-a367-95745c844d42@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_073654_977661_391D901C 
X-CRM114-Status: GOOD (  18.61  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAxMSBKYW4gMjAyNCAwNzoxNjowNiBQU1QgKC0wODAwKSwgYW5keS5jaGl1QHNpZml2
ZS5jb20gd3JvdGU6Cj4gSGkgUGFsbWVyLAo+Cj4gT24gVGh1LCBKYW4gMTEsIDIwMjQgYXQgMTA6
NTDigK9QTSA8cGF0Y2h3b3JrLWJvdCtsaW51eC1yaXNjdkBrZXJuZWwub3JnPiB3cm90ZToKPj4K
Pj4gSGVsbG86Cj4+Cj4+IFRoaXMgcGF0Y2ggd2FzIGFwcGxpZWQgdG8gcmlzY3YvbGludXguZ2l0
IChmb3ItbmV4dCkKPgo+IElJVUMgdGhlIGNvbmNsdXNpb24gZm9yIHRoaXMgdGhyZWFkIGlzIG5v
dCB0byBjaGVjayBTRCBiaXQgZm9yIGVpdGhlcgo+IHZlY3RvciBvciBmcHUuIFRoZSBwYXRjaCBm
b3IgdGhpcyB3YXMgc2VudCB0b2dldGhlciB3aXRoIHRoZQo+IGtlcm5lbC1tb2RlIHZlY3RvciBz
ZXJpZXMgYW5kIGhhcyBiZWVuIHJldmlld2VkLWJ5IGJvdGggU29uZyBhbmQgR3VvLgo+Cj4+IGJ5
IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKPj4KPj4gT24gVGh1LCAyMSBE
ZWMgMjAyMyAxNTowNDo0OSArMDgwMCB5b3Ugd3JvdGU6Cj4+ID4gVGhlIFNEIGJpdCBzdW1tYXJp
emVzIHRoZSBkaXJ0eSBzdGF0ZXMgb2YgRlMsIFZTLCBvciBYUyBmaWVsZHMsCj4+ID4gcHJvdmlk
aW5nIGEgImZhc3QgY2hlY2siIGJlZm9yZSBzYXZpbmcgZnN0YXRlIG9yIHZzdGF0ZS4KPj4gPgo+
PiA+IExldCBfX3N3aXRjaF90b192ZWN0b3IoKSBjaGVjayBTRCBiaXQgYXMgX19zd2l0Y2hfdG9f
ZnB1KCkgZG9lcy4KPj4gPgo+PiA+IEZpeGVzOiAzYTJkZjYzMjNkZWYgKCJyaXNjdjogQWRkIHRh
c2sgc3dpdGNoIHN1cHBvcnQgZm9yIHZlY3RvciIpCj4+ID4gU2lnbmVkLW9mZi1ieTogU29uZyBT
aHVhaSA8c29uZ3NodWFpc2h1YWlAdGlueWxhYi5vcmc+Cj4+ID4KPj4gPiBbLi4uXQo+Pgo+PiBI
ZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6Cj4+ICAgLSByaXNjdjogdmVjdG9yOiBDaGVj
ayBTUl9TRCBiZWZvcmUgc2F2aW5nIHZzdGF0ZQo+PiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9yaXNjdi9jL2UxYjc2YmMwMGVkMQo+Pgo+PiBZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEK
Pj4gLS0KPj4gRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4KPj4gaHR0cHM6Ly9rb3JnLmRvY3Mu
a2VybmVsLm9yZy9wYXRjaHdvcmsvcHdib3QuaHRtbAo+Pgo+Pgo+Cj4gUGxlYXNlIGxldCBtZSBr
bm93IGlmIEkgbWlzc2VkIGFueXRoaW5nLgoKU29ycnksIEkgbXVzdCBoYXZlIG1pc3VuZGVyc3Rv
b2QuICBJJ20gZHJvcHBpbmcgaXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
