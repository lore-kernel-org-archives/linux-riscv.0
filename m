Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FC9C0218D
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 06:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8K/0/lFW5YrEC9ZH2UFFhneaHX7n8PouMlaJC1ki9y4=; b=AJ5yb6tn6jHeNR
	ek6Glx42WADn8peUx1M6khy7l7MQ5hq37k8hw6oRsKJVZwb8wnv/9NK/rRAMUaO0ERgJvod1j11Pe
	P5XY5/aQuopZz0ve5e7E5wbkBqZJw/DUNQM9p+0Enj2A41LNSBbw2tlr0GrhhQ+2oVSwlIDT3ubbv
	zDMfL3/YQoSs9BKAzpmPjRTx4XRl3qZ6WyDaRK6QkPCQ/2w4zWSQdM1gSjJ4HD69HWcSAQQb3+Jj7
	+2alWX+iDgdyf0XhqR5TvnJZleASbQup0brBJkoJZWZRwvH0ooi73i7KRofyLyqI4TxDXaJzUuu05
	s0sWRfFpAqf6B4mlS7Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdk5A-0000000A2Zy-0qJ3;
	Fri, 31 Jan 2025 06:00:48 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdk57-0000000A2Zb-1YZB
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 06:00:47 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-216728b1836so27901725ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jan 2025 22:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738303244; x=1738908044; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MszCnuGzlzYtnQw0TdLrAActpTqVLNdV66U/Qofq/cM=;
        b=17NO8Ecdlmyt3WNzVPRRSqnSln9wwqWWC5/ScTJpeCCHDINmDnTQzKJHOvUZpP/P1H
         cORh85U84XVTNeyuJBMv1oGZmvWwbpEeRGcNOHt6zg5RYf/aoxOWphLhcV/43TtiS972
         vhdg+sOesIwNdLqNQSTAK9nHNbVpCoPQLhOI7A+O+AlRgNfEAoSZ7Jf+Tm3jOzee0uI4
         tCIxl28Ng8OGby0/U7UyGbifnvh4u0bVU8e+Jp8/GaBqZetgFLgT+7q8/GNrKP+h7pxW
         bZyKj+6lPKGpxm0FhlOc5OuMG38yHeFZm3sT7tNJ60GQOfRZjwgc7CdFg4J1zwnUZ1v7
         7q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738303244; x=1738908044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MszCnuGzlzYtnQw0TdLrAActpTqVLNdV66U/Qofq/cM=;
        b=fT7SwBV/I3GFC1VFKJzgeCt3+lpD3fGuviOf+sAbrOE2W49TtazMaWBkBJ7Z+3Kb+m
         0wpeRWOCC5GrRQF7oIqK5k9aFe7T1ztdThZEAH3lgHMAzE4iZTcCy54FpRMfQmu6gRVf
         IyHrCq+ccD9X5w62K2DFDpORzh3ZzMRzOiMvWRxddWydKOapIpe8ZflQ7Vt+hoXrgkWb
         GeRBBv/OVIbGoy9lu2rdrEA9EU+XPp9OHQXKNyPaFoTQ80vEub85Vb8GR3H3aFhVJlK6
         aO95qTJLrOSWoV9ePFbB7MzMkv9E+I6xh//hkSubVAcZsbrprpQ4rxRu80rfvT1oo4d4
         KB5w==
X-Forwarded-Encrypted: i=1; AJvYcCWyNMKYpE4q8eyilEkcwv/59Tu5+FxJjXGWeGdNOO4aLCF2jw6apY+jVdiFZPilLHWPv0c3OjWgj42oWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJPRpZ6y5e8Zc1VGKE9pjx4/GW8VkRfGScbk7fbw21nJbEvsIJ
	62gfrMxveB4ktS36Sts5S6RFsMusQQ64YpcwrB+q8sgwHElxMshCKn27Pfvdvh0=
X-Gm-Gg: ASbGnctyfkSlnUtdZ7I1RiiqvhIuf9APJ/3ZrsajqodDgPqK4JrK57TVJJ0/ZlrqCaw
	9HDkN9fGehwKuRE79tldu3BabmqjgEgaZHFkb6Ir0vzko6trBSpLSztcDC2IhTHnlTmsJDiqbay
	CvUmKzk1kUylbS6gfgG9Q/4NTV+0WKdx60dWa+J539XQEErIcBm5+WwGpow8BjT9o8xWWfgUMGr
	YyXygKZQmVopuxLrOFVrHagPmAm7DLjbFs93EX8gyKlXpn6sMqO22GPFXrq6GPPLv+ECl7gtiUg
	FL5h0nyvcm1qaSxrUvV7BLLokyGA8ab4SlBgHB4Q+myyfsP8Jw==
X-Google-Smtp-Source: AGHT+IHEjh47WLl29mwABTt+y+uZawVfuUOc5k+586NfPsYbIn6BvlbJi4+9ZSHmZZ6XXv3G4ndRqw==
X-Received: by 2002:a05:6a21:8cc2:b0:1e8:a374:ceb1 with SMTP id adf61e73a8af0-1ed7a6e15d5mr13685080637.42.1738303244438;
        Thu, 30 Jan 2025 22:00:44 -0800 (PST)
Received: from ghost (c-24-56-227-58.customer.broadstripe.net. [24.56.227.58])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebe856890sm2320390a12.42.2025.01.30.22.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 22:00:43 -0800 (PST)
Date: Thu, 30 Jan 2025 22:00:41 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Cyril Bur <cyrilbur@tenstorrent.com>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 2/4] riscv: uaccess: use input constraints for ptr of
 __put_user
Message-ID: <Z5xnCdp1l9tljwiO@ghost>
References: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
 <20241118230112.2872978-3-cyrilbur@tenstorrent.com>
 <EA2CB85E-E210-402E-B891-2F4420E55CDB@jrtc27.com>
 <f1218075-94a5-429a-ab35-f47d3e79e80e@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f1218075-94a5-429a-ab35-f47d3e79e80e@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_220045_675238_6742E031 
X-CRM114-Status: GOOD (  33.01  )
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

T24gRnJpLCBKYW4gMzEsIDIwMjUgYXQgMTI6MzE6MzhQTSArMTEwMCwgQ3lyaWwgQnVyIHdyb3Rl
Ogo+IAo+IAo+IE9uIDE4LzEvMjAyNSA5OjM0IGFtLCBKZXNzaWNhIENsYXJrZSB3cm90ZToKPiA+
IE9uIDE4IE5vdiAyMDI0LCBhdCAyMzowMSwgQ3lyaWwgQnVyIDxjeXJpbGJ1ckB0ZW5zdG9ycmVu
dC5jb20+IHdyb3RlOgo+ID4gPiAKPiA+ID4gRnJvbTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0Br
ZXJuZWwub3JnPgo+ID4gPiAKPiA+ID4gSSBiZWxpZXZlIHRoZSBvdXRwdXQgY29uc3RyYWludHMg
Ij1tIiBpcyBub3QgbmVjZXNzYXJ5LCBiZWNhdXNlCj4gPiA+IHRoZSBpbnN0cnVjdGlvbiBpdHNl
bGYgaXMgIndyaXRlIiwgd2UgZG9uJ3QgbmVlZCB0aGUgY29tcGlsZXIKPiA+ID4gdG8gIndyaXRl
IiBmb3IgdXMuIFNvIHRlbGwgY29tcGlsZXIgd2UgcmVhZCBmcm9tIG1lbW9yeSBpbnN0ZWFkCj4g
PiA+IG9mIHdyaXRpbmcuCj4gPiAKPiA+IFRoYXTigJlzIG5vdCB3aGF0ID1tIGRvZXMuID1tIHRl
bGxzIHRoZSBjb21waWxlciDigJx0aGlzIGFzc2VtYmx5IHdpbGwgYmUKPiA+IHdyaXRpbmcgdG8g
dGhpcyBtZW1vcnkgbG9jYXRpb24sIGFuZCBuZWVkcyB0aGUgYWRkcmVzcyBvZiB0aGUgbG9jYXRp
b24KPiA+IGZvciB0aGF0IG9wZXJhbmTigJ0uIElmIHlvdSBtb3ZlIGl0IGZyb20gYW4gb3V0cHV0
IHRvIGFuIGlucHV0IHRoZW4geW91Cj4gPiBnZXQgdGhlIHNhbWUgYXNzZW1ibHkgZ2VuZXJhdGVk
LCBidXQgdGhlIGNvbXBpbGVyIGJlbGlldmVzIHlvdSBhcmUKPiA+ICpyZWFkaW5nKiBmcm9tIHRo
YXQgbWVtb3J5LCBub3QgKndyaXRpbmcqIHRvIGl0LCBhbmQgc28gZG9lcyBub3QKPiA+IGJlbGll
dmUgdGhlIG1lbW9yeSBtYXkgYmUgY2xvYmJlcmVkLgo+ID4gCj4gPiBOb3csIGl0IG1heSB3ZWxs
IGJlIHRoYXQsIGJ5IHZpcnR1ZSBvZiB0aGlzIGJlaW5nIHVzZXJzcGFjZSBtZW1vcnkgdGhhdAo+
ID4gaXMgb25seSBldmVyIGFjY2Vzc2VkIHZpYSBhc3NlbWJseSwgYW5kIGFueSBpbmxpbmUgYXNz
ZW1ibHkgYmVpbmcKPiA+IG1hcmtlZCB2b2xhdGlsZSwgdGhpcyBpbiBlZmZlY3QgZG9lc27igJl0
IG1hdHRlci4gQnV0IGl0IGlzIHN0aWxsCj4gPiB0ZWNobmljYWxseSB3cm9uZyB0byBtb2RlbCBp
dCB0aGF0IHdheSwgYW5kIHlvdSBjYW5ub3QgdXNlIHRoZQo+ID4ganVzdGlmaWNhdGlvbiB5b3Ug
YXJlIHVzaW5nLCBiZWNhdXNlIGl0IGlzIGZhbHNlLCBhbmQgZGVtb25zdHJhdGVzIGEKPiA+IGxh
Y2sgb2YgdW5kZXJzdGFuZGluZyBmb3IgaG93IGlubGluZSBhc3NlbWJseSB3b3Jrcy4gSXQgaGFz
IHRvIGJlCj4gPiBjb3JyZWN0bHkganVzdGlmaWVkLgo+ID4gCj4gPiAoSSBkbyBub3RlIHRoYXQg
bmVpdGhlciB4ODYgbm9yIGFybTY0IHNlZW1zIHRvIG1vZGVsIHRoaXMgYXMgYW4gb3V0cHV0KQo+
ID4gCj4gPiBKZXNzCj4gCj4gR29vZCBwb2ludHMsIEkgYWdyZWUuIEkgYW0gaGFwcHkgdG8gcmVz
cGluIHRoaXMgcGF0Y2gKPiBtb3ZlIHRoZSA9bSB0byBvdXRwdXQgY29uc3RyYWludC4KPiAKPiBA
Q2hhcmxpZSBQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IHdvdWxkIGxpa2UgbWUgdG8KPiBrZWVw
IHlvdXIgdGFncyBvbiB0aGUgdHdlYWtlZCB2ZXJzaW9uLgoKQ2FuIHlvdSByZW1vdmUgdGhlIHRh
Z3M/IENvcHkgbWUgb24gdGhlIG5leHQgdmVyc2lvbiBhbmQgSSB3aWxsIHJldmlldwppdCBhZ2Fp
bi4KCi0gQ2hhcmxpZQoKPiAKPiBUaGFua3MsCj4gCj4gQ3lyaWwKPiA+IAo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEN5cmlsIEJ1ciA8Y3lyaWxidXJAdGVuc3RvcnJlbnQuY29tPgo+ID4gPiAtLS0KPiA+
ID4gYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91YWNjZXNzLmggfCAxOCArKysrKysrKystLS0tLS0t
LS0KPiA+ID4gMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkK
PiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VhY2Nlc3Mu
aCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4gPiA+IGluZGV4IDA5ZDRjYTM3
NTIyYy4uODRiMDg0ZTM4OGE3IDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3VhY2Nlc3MuaAo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VhY2Nlc3Mu
aAo+ID4gPiBAQCAtMTg2LDExICsxODYsMTEgQEAgZG8geyBcCj4gPiA+IF9fdHlwZW9mX18oKihw
dHIpKSBfX3ggPSB4OyBcCj4gPiA+IF9fYXNtX18gX192b2xhdGlsZV9fICggXAo+ID4gPiAiMTpc
biIgXAo+ID4gPiAtICIgIiBpbnNuICIgJXoyLCAlMVxuIiBcCj4gPiA+ICsgIiAiIGluc24gIiAl
ejEsICUyXG4iIFwKPiA+ID4gIjI6XG4iIFwKPiA+ID4gX0FTTV9FWFRBQkxFX1VBQ0NFU1NfRVJS
KDFiLCAyYiwgJTApIFwKPiA+ID4gLSA6ICIrciIgKGVyciksICI9bSIgKCoocHRyKSkgXAo+ID4g
PiAtIDogInJKIiAoX194KSk7IFwKPiA+ID4gKyA6ICIrciIgKGVycikgXAo+ID4gPiArIDogInJK
IiAoX194KSwgIm0iKCoocHRyKSkpOyBcCj4gPiA+IH0gd2hpbGUgKDApCj4gPiA+IAo+ID4gPiAj
aWZkZWYgQ09ORklHXzY0QklUCj4gPiA+IEBAIC0yMDMsMTYgKzIwMywxNiBAQCBkbyB7IFwKPiA+
ID4gdTY0IF9feCA9IChfX3R5cGVvZl9fKCh4KS0oeCkpKSh4KTsgXAo+ID4gPiBfX2FzbV9fIF9f
dm9sYXRpbGVfXyAoIFwKPiA+ID4gIjE6XG4iIFwKPiA+ID4gLSAiIHN3ICV6MywgJTFcbiIgXAo+
ID4gPiArICIgc3cgJXoxLCAlM1xuIiBcCj4gPiA+ICIyOlxuIiBcCj4gPiA+IC0gIiBzdyAlejQs
ICUyXG4iIFwKPiA+ID4gKyAiIHN3ICV6MiwgJTRcbiIgXAo+ID4gPiAiMzpcbiIgXAo+ID4gPiBf
QVNNX0VYVEFCTEVfVUFDQ0VTU19FUlIoMWIsIDNiLCAlMCkgXAo+ID4gPiBfQVNNX0VYVEFCTEVf
VUFDQ0VTU19FUlIoMmIsIDNiLCAlMCkgXAo+ID4gPiAtIDogIityIiAoZXJyKSwgXAo+ID4gPiAt
ICI9bSIgKF9fcHRyW19fTFNXXSksIFwKPiA+ID4gLSAiPW0iIChfX3B0cltfX01TV10pIFwKPiA+
ID4gLSA6ICJySiIgKF9feCksICJySiIgKF9feCA+PiAzMikpOyBcCj4gPiA+ICsgOiAiK3IiIChl
cnIpIFwKPiA+ID4gKyA6ICJySiIgKF9feCksICJySiIgKF9feCA+PiAzMiksIFwKPiA+ID4gKyAi
bSIgKF9fcHRyW19fTFNXXSksIFwKPiA+ID4gKyAibSIgKF9fcHRyW19fTVNXXSkpOyBcCj4gPiA+
IH0gd2hpbGUgKDApCj4gPiA+ICNlbmRpZiAvKiBDT05GSUdfNjRCSVQgKi8KPiA+ID4gCj4gPiA+
IC0tIAo+ID4gPiAyLjM0LjEKPiA+ID4gCj4gPiA+IAo+ID4gPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKPiA+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gPiAKPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
