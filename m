Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD5BCCD184
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Oct 2025 21:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JhJEGgYLzskntNDXNBYROJdwm/YJas6iw6yO5cU0dVQ=; b=KFaaaXAawcZdCy
	c1lX3zEXFsx9fInqvtHR48E2gM0zSFkC5hEnWGkJo/NusMcOlkyYGS0tvFvEjXCunNAYIbJZnPxx5
	lisXrvltVEvX4g9fxkoekMy3bsnLL2LuvIH3Cf+R1Iareh+EoQ1OoHdbrhkNAsxbLaJ3V+8jU/KM+
	FJJHr8JYttAIGp+EE2iJgw7jE6vHlsX8OlSD2T0V7CflusK33n9eWjbn9raWauiJeSdpqQZ8VVyBq
	zzK0NzysDDMUT5zd2h6owydZQW/Sol21VnxYCcSwnYRlIHe/eLfZjY86yWqTlgkRdlOrPmJdyUUeC
	9VKNYkm+V/KEi1Lq48BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAaxk-0000000BSfJ-3tye;
	Sun, 19 Oct 2025 21:29:12 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAaxi-0000000BSes-1hxb
	for linux-riscv@lists.infradead.org;
	Sun, 19 Oct 2025 21:29:11 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-58d29830058so4459565e87.0
        for <linux-riscv@lists.infradead.org>; Sun, 19 Oct 2025 14:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760909348; x=1761514148; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pZgFs4FqCijykpFkWDu4oRoguWT7PdOtyygPCwJLRbY=;
        b=ipp9Epf/D5g2ELJBwl/4CVahtTQNcwD63884l7TUOIYMkgTxff6HiXYyd2hwvijzgV
         SE4YtBxQ2bYe7fT/DE/SqR9LfZE54tJ/MlfTB2MBsMzVgkmx4WGfWzDZU8QL70vL7JF7
         7RHGcE4rPZpB6G7QHuxC8M8xIo81Xl4N4yn7RXwJo/9K1luEDe7Wzd7OvWyh4tlS/cOK
         QhuRNY7SoB7f+aDaQbvnJs4u+W7aHyoB7l+EWGF21O02CWrRwx1vyRXF1sgNHY5fwvOq
         4wbDf0KRbUVlIPiItyC2KkilR5eQc9zB0aq92uZkSZilpC0yk1XQMVXVcvYdMuMb1Zqw
         PK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760909348; x=1761514148;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pZgFs4FqCijykpFkWDu4oRoguWT7PdOtyygPCwJLRbY=;
        b=tMBFlStzZoq7y5/IHwwaT7w5f9RE9b6J3knlwGo0iXCcBRrHiN+1U70XUy6jbn8G1V
         BVv5hN6VjdPUjbG1xYUDoVaJFdrHYGkBMn5FZ9/v1BI7suxmg+vUazi8aH9KY2ZFqO4u
         NP2Fdx0gsyHQLZwwgHVGWmn2gM437Wdr6XNBM7bXRwd2L/Q42/DswHpl/IN/qLVP73kp
         koVsaSbsjm1UkzsjjszwHzcovm0gVRdZPxUNcQesOmmbSzrFggONOajTC8HuGfa4oeqV
         rK2t4zZM2+YGolpD4PsYFYow7c8eTIT+maKRZ8+cgERQwQGep0GQ3oj9A9t8sNJMo/cm
         gPPQ==
X-Gm-Message-State: AOJu0YxoQcO8w0IHXvT5QuYDJuhNEdKXg5eDYzjoq9HHD30wXLMRRC9L
	zrlpyCC0W4VMkCagK0mdJcnLq6prjTELKzZNbM9HSp36SjwOhew/Vk1T
X-Gm-Gg: ASbGncub+wnuuYEpZBKzyVS4xuKh2h0vPsWpLK33dBAn1othj14iHJyCnTFsx6ZOGxW
	ZU6r5cNDs/QjrwKoX0hB9aGB3QQTxA8U2x8N4nRDIVFK2CnGNOPIV9zCB0BeioeBY2L9FqgKRZm
	F/KM8NZiDxBzPX+GH7C567w6HCJd6vIx747xx61IXXLwIhCwvb3QFzTWrbRzAuU3AssUSSN0yA6
	OK/uHNQXACboXynkEabV5z6QCapQAoLXLdOsFbvMhYIH9y4RXDJaMSajQt/mIfLlE7TZ6obUgID
	8Pdecyphf0tJG8Qsr9s3JjWQElntFuVvfTqlx0VUKYFpuRWKf4W9zsFdT8mnd6I09RkL8Gx+Bwv
	JDaWKwR5wy50JRHwiV6p9Efs/bvXsXof3O/47LION2d+a8ktEd2lYmfSdkPIQxUeMrSA=
X-Google-Smtp-Source: AGHT+IH+I9jBbkDr97iE8CLeVNtuiq8X8wVyPEdeyjvp5fA2TYxHDV4mbw9+9KOh4C6CfUUvY8XePA==
X-Received: by 2002:a05:6512:2251:b0:57b:fb1d:616e with SMTP id 2adb3069b0e04-591d85661b0mr3583795e87.39.1760909347750;
        Sun, 19 Oct 2025 14:29:07 -0700 (PDT)
Received: from curiosity ([5.188.167.4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def25a51sm1875026e87.107.2025.10.19.14.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 14:29:06 -0700 (PDT)
Date: Mon, 20 Oct 2025 00:29:04 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Andy Chiu <andybnac@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nam Cao <namcao@linutronix.de>,
	Joel Granados <joel.granados@kernel.org>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 4/6] riscv: vector: allow to force vector context save
Message-ID: <aPVYIOz8XRZ-737r@curiosity>
References: <20251007115840.2320557-1-geomatsi@gmail.com>
 <20251007115840.2320557-5-geomatsi@gmail.com>
 <CAFTtA3MObvXRHxbULghGcT=ThrBDeFDJzUY7LOhgNnarzpYeGg@mail.gmail.com>
 <CAFTtA3NoOZEMqYD6+vjP=09T15GiThjVy1LeDX0U8CC-4HMKOA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFTtA3NoOZEMqYD6+vjP=09T15GiThjVy1LeDX0U8CC-4HMKOA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_142910_467821_1CA014FF 
X-CRM114-Status: GOOD (  28.71  )
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

T24gV2VkLCBPY3QgMTUsIDIwMjUgYXQgMDQ6MzI6MDVQTSAtMDUwMCwgQW5keSBDaGl1IHdyb3Rl
Ogo+IE9uIFdlZCwgT2N0IDE1LCAyMDI1IGF0IDM6MTjigK9QTSBBbmR5IENoaXUgPGFuZHlibmFj
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBPY3QgNywgMjAyNSBhdCA2OjU44oCv
QU0gU2VyZ2V5IE1hdHl1a2V2aWNoIDxnZW9tYXRzaUBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+
ID4gPiBXaGVuIHB0cmFjZSB1cGRhdGVzIHZlY3RvciBDU1IgcmVnaXN0ZXJzIGZvciBhIHRyYWNl
ZCBwcm9jZXNzLCB0aGUKPiA+ID4gY2hhbmdlcyBtYXkgbm90IGJlIGltbWVkaWF0ZWx5IHZpc2li
bGUgdG8gdGhlIG5leHQgcHRyYWNlIG9wZXJhdGlvbnMKPiA+ID4gZHVlIHRvIHZlY3RvciBjb250
ZXh0IHN3aXRjaCBvcHRpbWl6YXRpb25zLgo+ID4gPgo+ID4gPiBUaGUgZnVuY3Rpb24gJ3Jpc2N2
X3ZfdnN0YXRlX3NhdmUnIHNhdmVzIGNvbnRleHQgb25seSBpZiBtc3RhdHVzLlZTIGlzCj4gPiA+
ICdkaXJ0eScuIEhvd2V2ZXIgbXN0YXR1cy5WUyBvZiB0aGUgdHJhY2VkIHByb2Nlc3MgY29udGV4
dCBtYXkgcmVtYWluCj4gPiA+ICdjbGVhbicgYmV0d2VlbiB0d28gYnJlYWtwb2ludHMsIGlmIG5v
IHZlY3RvciBpbnN0cnVjdGlvbnMgd2VyZSBleGVjdXRlZAo+ID4gPiBiZXR3ZWVuIHRob3NlIHR3
byBicmVha3BvaW50cy4gSW4gdGhpcyBjYXNlIHRoZSB2ZWN0b3IgY29udGV4dCB3aWxsIG5vdAo+
ID4gPiBiZSBzYXZlZCBhdCB0aGUgc2Vjb25kIGJyZWFrcG9pbnQuIEFzIGEgcmVzdWx0LCB0aGUg
c2Vjb25kIHB0cmFjZSBtYXkKPiA+ID4gcmVhZCBzdGFsZSB2ZWN0b3IgQ1NSIHZhbHVlcy4KPiA+
Cj4gPiBJSVVDLCB0aGUgc2Vjb25kIHB0cmFjZSBzaG91bGQgbm90IGdldCB0aGUgc3RhbGUgdmVj
dG9yIENTUiB2YWx1ZXMuCj4gPiBUaGUgc2Vjb25kIHJpc2N2X3ZyX2dldCgpIHNob3VsZCBiZSBy
ZWFkaW5nIGZyb20gdGhlIGNvbnRleHQgbWVtb3J5Cj4gPiAodnN0YXRlKSwgd2hpY2ggaXMgdXBk
YXRlZCBmcm9tIHRoZSBsYXN0IHJpc2N2X3ZyX3NldCgpLiBUaGUgdXNlcidzCj4gPiB2c3RhdGUg
c2hvdWxkIHJlbWFpbiB0aGUgc2FtZSBzaW5jZSBsYXN0IHJpc2N2X3ZyX3NldCgpLiBDb3VsZCB5
b3UKPiA+IGV4cGxhaW4gbW9yZSBvbiBob3cgdGhpcyBidWcgaXMgb2JzZXJ2ZWQgYW5kIHdoeSBv
bmx5IENTUnMgYXJlCj4gPiBhZmZlY3RlZCBidXQgbm90IHYtcmVncyBhcyB3ZWxsPwo+IAo+IEZy
b20gbG9va2luZyBpbnRvIHlvdXIgdGVzdCwgSSBjYW4gc2VlIHRoYXQgeW91IHdlcmUgdHJ5aW5n
IHRvIHNldCBhbgo+IGludmFsaWQgY29uZmlndXJhdGlvbiB0byBWZXRvciBDU1JzIGFuZCBleHBl
Y3QgdmlsbCB0byBiZSByZWZsZWN0ZWQKPiB1cG9uIG5leHQgcmVhZC4gWWVzLCB0aGlzIGlzIG5v
dCBoYXBwZW5pbmcgb24gdGhlIGN1cnJlbnQKPiBpbXBsZW1lbnRhdGlvbiBhcyBpdCB3YXMgbm90
IGV4cGVjdGluZyBpbnZhbGlkIGlucHV0IGZyb20gdGhlIHVzZXIsCj4gd2hpY2ggc2hvdWxkIGJl
IHRha2VuIGludG8gY29uc2lkZXJhdGlvbi4gVGhhbmtzIGZvciBzcG90dGluZyB0aGUKPiBjYXNl
IQo+IAo+IEFjY29yZGluZyB0byB0aGUgc3BlYywgIlRoZSB1c2Ugb2YgdnR5cGUgZW5jb2Rpbmdz
IHdpdGggTE1VTCA8Cj4gU0VXTUlOL0VMRU4gaXMgcmVzZXJ2ZWQsIGltcGxlbWVudGF0aW9ucyBj
YW4gc2V0IHZpbGwgaWYgdGhleSBkbyBub3QKPiBzdXBwb3J0IHRoZXNlIGNvbmZpZ3VyYXRpb25z
LiIgVGhpcyBtZWFuIHRoZSBpbXBsZW1lbnRhdGlvbiBtYXkKPiBhY3R1YWxseSBzdXBwb3J0IHRo
aXMgY29uZmlndXJhdGlvbi4gSWYgdGhhdCBpcyB0aGUgY2FzZSwgSSB0aGluayB3ZQo+IHNob3Vs
ZCBub3QgYWxsb3cgdGhpcyB0byBiZSBjb25maWd1cmVkIHRocm91Z2ggdGhlIHZlY3RvciBwdHJh
Y2UKPiBpbnRlcmZhY2UsIHdoaWNoIGlzIGRlc2lnbmVkIHRvIHN1cHBvcnQgMS4wIChhbmQgMC43
KSBzcGVjcy4gVGhhdAo+IG1lYW5zLCB3ZSBzaG91bGQgbm90IGFsbG93IHRoaXMgcHJvYmxlbWF0
aWMgY29uZmlndXJhdGlvbiB0byBwYXNzCj4gdGhyb3VnaCByaXNjdl92cl9zZXQoKSwgcmVhY2gg
dXNlciBzcGFjZSwgdGhlbiB0aGUgZm9yY2VkIHNhdmUuCj4gCj4gSSB3b3VsZCBvcHQgZm9yIHZh
bGlkYXRpbmcgYWxsIENTUiBjb25maWd1cmF0aW9ucyBpbiB0aGUgZmlyc3QgcGxhY2UuCj4gQ291
bGQgeW91IGFsc28gaGVscCBlbmZvcmNlIGNoZWNrcyBvbiBvdGhlciByZXNlcnZlZCBiaXRzIGFz
IHdlbGw/CgpKdXN0IHRvIGNsYXJpZnksIHRoZSBzdWdnZXN0aW9uIGlzIHRvIGRyb3AgdGhlIFRJ
Rl9SSVNDVl9WX0ZPUkNFX1NBVkUKZW50aXJlbHkgYW5kIHVzZSBvbmx5IGNhcmVmdWwgdmFsaWRh
dGlvbiBvZiBpbnB1dCBwYXJhbWV0ZXIgaW4gcmlzY3ZfdnJfc2V0LApyYXRoZXIgdGhhbiB1c2lu
ZyBib3RoIGNoZWNrcy4gSXMgdGhhdCBjb3JyZWN0PwoKSWYgdGhhdCBpcyBjb3JyZWN0LCB0aGVu
IEkgYXNzdW1lIHdlIGNhbiByZWx5IG9uIHRoZSBzaW1wbGUgcnVsZSBFTEVOID09IFhMRU4KdG8g
dmFsaWRhdGUgdnNldy92bG11bCBzdXBwb3J0ZWQgY29tYmluYXRpb25zLiBBZGRpdGlvbmFsbHks
IHJlc2VydmVkIHZzZXcKdmFsdWVzIChzZWUgMy40LjEgaW4gc3BlYykgc2hvdWxkIGFsc28gYmUg
cmVqZWN0ZWQuCgpUaGFua3MsClNlcmdleQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
