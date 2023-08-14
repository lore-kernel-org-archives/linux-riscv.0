Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED94C04A94
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 15:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ifGv+ZYfH1gRyYaOe/Z4YbF6pehTLGvloXILMHfXp30=; b=JqNEc2WpWUeJ1w
	0jL3Mo9QxUCujvrfDfMihqmIdT1AHCTi+IN6YNC+7Va5wGMMjoHrUdFpgKve2ThkRo6pcoDZSQNsm
	PSvW4xpZ+Ho9Kt34zD8+BnxiohX/j82sRFPh4iHeid0PYNXJCCEz8sEVljqCvC9RmAt4LNzDb19Y9
	/1zQKFcQXyhGnBy9feWLb+paUejfQu08W/b8jEyU8qQ2KNxTbBhSeNw4x9GDBeA1/zwD5VT0bFKJL
	aTIKygU2Y9SNtCwrjTrCguzNrm7GcvpvXsR8HFd8vk9EZ4ipZAa0mlYD9UPcl5ADPFQrxr8Vq2TS+
	IhDoEpyRUEgIy8ImaQkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVZbG-00HSui-2f;
	Mon, 14 Aug 2023 15:35:22 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVZbD-00HSs4-1a
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 15:35:21 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-48735dd1b98so1875013e0c.2
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 08:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692027314; x=1692632114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwZynochhhORLpCB6DjxeAh/RlJ/3P4bMuPp8yyJkYU=;
        b=s3U1x+uHEnmCITDqc5tFkzyv81a4pTKNhmXBWqyyQCBwJ9lDyueXPs+QJvFwfQrFv1
         94mhMEJao3y8DJwc5oT8+dt+Wr5UYBw8TJO4d2VdkCf0E89LWqvbledG56xkQRlB+lJv
         HuJ9jTT72Kq/5bgapQkAxcYjD8j6PlyUeVgX8I7P87QjXz0oQox69zOZ9u7aPBTSXRgD
         QFb8wVl+85tBx+gVSaWaHvoU+8kaW9jaFBmNV8FlNahqC7H5yxnqxDIvvUeHXpJXa503
         C0FHZxfT/PQTJT7IQ7K01NejMXA2qQ8a+AK3N2+qI1t9D+ODBO6qm+92WTFZ7JLaRuoq
         LyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692027314; x=1692632114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dwZynochhhORLpCB6DjxeAh/RlJ/3P4bMuPp8yyJkYU=;
        b=F1nrScjiFPUV9TWPDNpj8qhPchuHnx2WNH8l2fWpnaLL+Ntl+O+LUrjMforgld2bLT
         Z1UP0oAeXJu3wsyPrHrh4c3W6+2qG9nfnjDcgD+33KPORreT/8IupagdqGDf1abYelR0
         1hypclZC79fqtChnLnzbOB8+4qdGW9aZvmyiuxMVigZhkk5eIgTJa5CvExX7QDyx5rke
         4uIyQJ7KhAbHfn1oGFwvF6HPJJwGXFf2H2qx6kuQZF+zMrR53jHEWpPVDi83+CSPWBsF
         uUwG+Ah66D8RGH2kYRizBfp2Xd7OhW1Cotxp41gCbTm5JU3a+ohIfuaJAZa0k3ZyopHe
         80CQ==
X-Gm-Message-State: AOJu0YzhKDWKYnQ+Y7KZTm8YmgL8ipQ1c672oto9Pe64tGf2dLO2HfZ5
	YMzuFDNFmWjxAs7pNxxy5VP22GPXxDbLfH4dSocpNQ==
X-Google-Smtp-Source: AGHT+IEc/ansqEvhUK8upK41DzZmZXeg9i65FyaNq/0zMjuxetY5EwlfjUBrV9vueWGSzkKHu9AeI3Av2jUqmfgPyhA=
X-Received: by 2002:a67:ee07:0:b0:445:91b:385d with SMTP id
 f7-20020a67ee07000000b00445091b385dmr9781787vsp.12.1692027314070; Mon, 14 Aug
 2023 08:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230811233556.97161-8-samitolvanen@google.com>
 <202308122238.XLMMmeL0-lkp@intel.com> <CAJF2gTQmezqnJo68CuV8e+=RwCAioKbk0UqTS_fq5--HjUTLDw@mail.gmail.com>
In-Reply-To: <CAJF2gTQmezqnJo68CuV8e+=RwCAioKbk0UqTS_fq5--HjUTLDw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 14 Aug 2023 08:34:37 -0700
Message-ID: <CABCJKueRPOEiRdGoT5A+c3s7zbH3YqvFUcQowwXMUT4CmFyBEw@mail.gmail.com>
Subject: Re: [PATCH 1/5] riscv: VMAP_STACK overflow detection thread-safe
To: Guo Ren <guoren@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Deepak Gupta <debug@rivosinc.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_083519_547282_926827DF 
X-CRM114-Status: GOOD (  13.32  )
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

T24gU2F0LCBBdWcgMTIsIDIwMjMgYXQgNjoyNeKAr1BNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFNhdCwgQXVnIDEyLCAyMDIzIGF0IDEwOjM24oCvUE0ga2VybmVs
IHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIFNhbWksCj4gPgo+
ID4ga2VybmVsIHRlc3Qgcm9ib3Qgbm90aWNlZCB0aGUgZm9sbG93aW5nIGJ1aWxkIGVycm9yczoK
PiA+Cj4gPiBbYXV0byBidWlsZCB0ZXN0IEVSUk9SIG9uIDUyYTkzZDM5YjE3ZGM3ZWI5OGI2YWEz
ZWRiOTM5NDMyNDhlMDNiMmZdCj4gPgo+ID4gdXJsOiAgICBodHRwczovL2dpdGh1Yi5jb20vaW50
ZWwtbGFiLWxrcC9saW51eC9jb21taXRzL1NhbWktVG9sdmFuZW4vcmlzY3YtVk1BUF9TVEFDSy1v
dmVyZmxvdy1kZXRlY3Rpb24tdGhyZWFkLXNhZmUvMjAyMzA4MTItMDczNzUxCj4gPiBiYXNlOiAg
IDUyYTkzZDM5YjE3ZGM3ZWI5OGI2YWEzZWRiOTM5NDMyNDhlMDNiMmYKPiA+IHBhdGNoIGxpbms6
ICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzA4MTEyMzM1NTYuOTcxNjEtOC1zYW1p
dG9sdmFuZW4lNDBnb29nbGUuY29tCj4gPiBwYXRjaCBzdWJqZWN0OiBbUEFUQ0ggMS81XSByaXNj
djogVk1BUF9TVEFDSyBvdmVyZmxvdyBkZXRlY3Rpb24gdGhyZWFkLXNhZmUKPiA+IGNvbmZpZzog
cmlzY3YtcmFuZGNvbmZpZy1yMDQyLTIwMjMwODEyIChodHRwczovL2Rvd25sb2FkLjAxLm9yZy8w
ZGF5LWNpL2FyY2hpdmUvMjAyMzA4MTIvMjAyMzA4MTIyMjM4LlhMTU1tZUwwLWxrcEBpbnRlbC5j
b20vY29uZmlnKQo+ID4gY29tcGlsZXI6IGNsYW5nIHZlcnNpb24gMTcuMC4wIChodHRwczovL2dp
dGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QuZ2l0IDRhNWFjMTRlZTk2OGZmMGFkNWQyY2MxZmZh
MDI5OTA0OGRiNGM4OGEpCj4gPiByZXByb2R1Y2U6IChodHRwczovL2Rvd25sb2FkLjAxLm9yZy8w
ZGF5LWNpL2FyY2hpdmUvMjAyMzA4MTIvMjAyMzA4MTIyMjM4LlhMTU1tZUwwLWxrcEBpbnRlbC5j
b20vcmVwcm9kdWNlKQo+ID4KPiA+IElmIHlvdSBmaXggdGhlIGlzc3VlIGluIGEgc2VwYXJhdGUg
cGF0Y2gvY29tbWl0IChpLmUuIG5vdCBqdXN0IGEgbmV3IHZlcnNpb24gb2YKPiA+IHRoZSBzYW1l
IHBhdGNoL2NvbW1pdCksIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZ3MKPiA+IHwgUmVwb3J0ZWQt
Ynk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+ID4gfCBDbG9zZXM6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyMzA4MTIyMjM4LlhMTU1tZUwwLWxr
cEBpbnRlbC5jb20vCj4gPgo+ID4gQWxsIGVycm9ycyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4p
Ogo+ID4KPiA+ID4+IGxkLmxsZDogZXJyb3I6IHVuZGVmaW5lZCBzeW1ib2w6IF9fcGVyX2NwdV9v
ZmZzZXQKPiA+ICAgID4+PiByZWZlcmVuY2VkIGJ5IGFyY2gvcmlzY3Yva2VybmVsL2VudHJ5Lm86
KGhhbmRsZV9rZXJuZWxfc3RhY2tfb3ZlcmZsb3cpIGluIGFyY2hpdmUgdm1saW51eC5hCj4gIUNP
TkZJR19TTVAgbWlzc2VkCgpJbmRlZWQuIEknbGwgZml4IHRoaXMgaW4gdjIuCgpTYW1pCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
