Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFBCC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 02:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Da/LOMT/hT1zqw2YWZmnDaL49B5OKGVUVKW7BkElvnY=; b=xtriU2WITTO0Tc
	2/NQVRdvSfIQquzfworLlBNc0R0yZNSiWWl4aeWP0binqz2UjawL8AHxCrIZU7or/ZxH3bmG1okjb
	Jk7F8QvxWHvF0eDTTV/ozWCX3gnr4ElmkJnmnHFIC9/3GSpPXJhwlFN49oVTtw1DrAS/x4F3gUnmh
	T2ckebXCK62MWLlQ+dRLffMrZPYzsKpvmHCHfUG2ORRmtqOyyjju/Z6+ROIwEkPy8lfMR+KZSxyC3
	leQUOdV6snwB1frIBQjcNFUTcAAptOgnSlztCwotadk192+NakcO6Ye3+eSZMSjmMIH8ZTLffZYKE
	d+eVSpzfNrxpR/u8ZDJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv6Mw-0000000Es8C-26RV;
	Fri, 12 Apr 2024 02:10:22 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv6Ms-0000000Es7K-3RFJ
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 02:10:20 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5aa4a1246b1so322107eaf.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 19:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1712887816; x=1713492616; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3byBbhHPbAbBuHjuvastDaMYVcOaFYFEWRQWWcNBJEs=;
        b=Y8dr/v+2hUBB2+WgB6SSE/SMDBcFYbjnW2nafpWHB3ZwpnDQ4POiV6B08kFckR+EF4
         0uyhAV5sWr7CxUnZANZikKwYtulk3l1H0GPbXYTup2EjQNIQoKbeTbFxZMYE3XSDEcqk
         uU2WMuMwLdTVU9bOyu0d6o77Pp/8N975PogpmcIkfWw2edqCEF3qLqJGLSN0Jl2Zxhds
         s+CbUKX084wQtXjOoFIhEf1ZUMWPq/zFU63CopLZKWdVZvIU4a+VtaXcClSBvFtvBfT0
         Lbc+zO2jcBjKru2Fq4KJ24qzRFsxcn2AruVyrE6iQN/FcLEk64jir6H4OmJ1cRz9JsxI
         nzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712887816; x=1713492616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3byBbhHPbAbBuHjuvastDaMYVcOaFYFEWRQWWcNBJEs=;
        b=DYfIeZChH6DekytVfnsGA3J9BSqmwGvrSiHxsO57k5c9XKdT29B4Jn4JSUofTHpq/j
         zft2x1d6hoDZnCX/4/DP1jhmm2WFZlzZulIo70qRA99hmr1Ds/rs+oJArA+Eyf6QDmtL
         ey6OYC4DAe2C0zIp68p5fpwBjfiOkzK0L7PDfKaxX9XpvzehKdcZjbKHZpva+Pgnlfcw
         g4HfvPB56qYkBnxnWYHmG6fgzKMFRSjoZi8l6c5VawjZ5VspjijLwJVkyArBedmytVKm
         6i8psxLKm6CvmMW2n68jMQDPqa0bRDpWgA3Ch3IqhoglDqWXj2jmwDYBxgMowjwN11eM
         tCeg==
X-Forwarded-Encrypted: i=1; AJvYcCUTprZxw2lnarEfoRbYhVRtxk/TVOUcR1cW7PsZM7jB9/o/0c8QEQSAVuGw+LpNNzkAH16yBwhaHMLnEW79y/Bw1KCMBQ3WnJ/VU+fgKYON
X-Gm-Message-State: AOJu0YytA3Mo9RkIYFQyWv75dmICMbFlizgX1XcaFKeunkGaUxT6zCNK
	Y4WtB7w4X99b1FV43nOAheiNc3QHk5ZidST3W3qI1ceQheOzZYKN7r8xe9Y7zQN4HArpBCDgGZ/
	UVZMdi2S1UWI9txJeci92f3sYU+KCrl7GeTd0Dw==
X-Google-Smtp-Source: AGHT+IGlOlFyLP7nb72631wmeBnbeNqFrUTNa6xuGgqZC1KLH6e9hMuOyTmu/5EQbYJDgq3GFRyDSHVjJyECJ38qxLI=
X-Received: by 2002:a05:6870:390c:b0:233:4685:aea3 with SMTP id
 b12-20020a056870390c00b002334685aea3mr1355286oap.41.1712887816077; Thu, 11
 Apr 2024 19:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240407123829.36474-1-cuiyunhui@bytedance.com> <ZhetojJewygmTf6N@bogus>
In-Reply-To: <ZhetojJewygmTf6N@bogus>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 12 Apr 2024 10:10:05 +0800
Message-ID: <CAEEQ3wkfHvH4jXNO5NRDf0Fc3xUkY64hp7BDBmgNVdcsmYy-kA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] ACPI: PPTT: Populate cacheinfo
 entirely with PPTT
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_191019_038597_8AED1792 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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

SGkgU3VkZWVwLAoKT24gVGh1LCBBcHIgMTEsIDIwMjQgYXQgNTozMOKAr1BNIFN1ZGVlcCBIb2xs
YSA8c3VkZWVwLmhvbGxhQGFybS5jb20+IHdyb3RlOgo+Cj4gT24gU3VuLCBBcHIgMDcsIDIwMjQg
YXQgMDg6Mzg6MjhQTSArMDgwMCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+IFdoZW4gdGhlIHR5cGUg
YW5kIGxldmVsIGluZm9ybWF0aW9uIG9mIHRoaXNfbGVhZiBjYW5ub3QgYmUgb2J0YWluZWQKPiA+
IGZyb20gYXJjaCwgY2FjaGVpbmZvIGlzIGNvbXBsZXRlbHkgZmlsbGVkIGluIHdpdGggdGhlIGNv
bnRlbnQgb2YgUFBUVC4KPiA+Cj4KPiBXaGljaCBwbGF0Zm9ybSBpcyB0aGlzID8gSXMgdGhpcyBh
cm02NCBiYXNlZCBvciBzb21ldGhpbmcgZWxzZSBsaWtlIFJJU0MtVgo+IGJhc2VkID8gVGhhdCB3
b3VsZCBoZWxwIHRvIHVuZGVyc3RhbmQgc29tZSBjb250ZXh0IGhlcmUuCj4KClRoYW5rcyBmb3Ig
eW91ciByZXNwb25zZSwgUklTQy1WIGN1cnJlbnRseSBoYXMgdGhpcyByZXF1aXJlbWVudC4KUGxl
YXNlIHNlZTogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2
L3BhdGNoLzIwMjQwNDA3MTIzODI5LjM2NDc0LTItY3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20vCgpU
aGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
