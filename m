Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45FFE77188
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Dec 2024 10:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a11aP6ugj3KZF20heJ5BdbwHZfAXv8AZXAxrFQxRN1o=; b=zMZkSl6jnUYN+S
	uNqMluGpFqi8+rPTvHrF2/CsDTg8pXkzjicJT6FBpJU+MgLhu3STyUVmr2ugZ0jy8CNKtZKgwS1GZ
	7+Mrro07gmnIV8rQi2qeTkewlsRr8SD9lGYLTHFL8nzy4n8srTN4+wPFtaqoAlOhZTbD7ypF0fbaz
	3ohNUS3XNCefbuvwlNAkVGU5MeJeCLk8dp4srr645oht9/GsQ0xYVF3g+EpRydf8LDi6OQMifH5Iu
	8+xg/Uck0zt9BiA4NUOHEGnWuDJzVHtyeHUJsyMfpLw+jlR3CaXE9ZyMzVdHK8FQExPXXrGZ3miWB
	+gnrTJ36SXSFQ5UkSaWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSZed-000000072r5-2GTc;
	Tue, 31 Dec 2024 10:39:15 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSZeb-000000072qY-1h7k
	for linux-riscv@lists.infradead.org;
	Tue, 31 Dec 2024 10:39:14 +0000
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-51882748165so3254886e0c.3
        for <linux-riscv@lists.infradead.org>; Tue, 31 Dec 2024 02:39:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735641550; x=1736246350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gEbbuKMZayYyKEyTEaWHpC2wQsOaUYAwQVt6YhVlPQg=;
        b=WpTDdiXooax2VivDt0HIua9am/S0SFI781YAsyeSigxGgTmH5YxF2CxRlr9qqfPLUG
         xSITZpDHxdM7LL7B1cRgnaQv7kikdeRtVdfaowuFVUNvlMk7i1YgFuEUlqA7MeVLjGXW
         p41v/caxT8/r2iEhZbT59SHSTFMPYYl+Cj3qI5IksGArLh5ddg0kD/dc4yP+a0Vc4hXo
         Y1FedLxdyR9W9dUxfoHDDYIl0eDwtLn51DmZg0GHT8LCHA75LkmanGrSLt/l+Yuon7vr
         JTt9enqxYCne/1FxrHnwSZ2vrqqwQzqld+PrLdK8SWImWfv2/QC01Q3Zn0DHbLAYr4/r
         l5/g==
X-Forwarded-Encrypted: i=1; AJvYcCUDJ8Y7P9K7qMWjHc88UarAX8Ip6wt8WvbzzoXjj5E/NNKPQN7ry+FTeE2bD94+mPqbOoQtR1EbAgbO6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9ouPTs5K+7sRTzZVf9KXR2YsZ1CoubNhmxF2G5HmiGBamFNcm
	+CofwZo7lvalRB5JToDm/591w7LC/EuXQD+CP/ZzGqL9VEKjUZB2jQy2twR+
X-Gm-Gg: ASbGncuny4otpDPFQrSIUOb1aiTYd5uFZyPjQ0g8jU5Fkt0BGNuogbcHcCupLZY8ZrE
	kedgQ3stcSGPHfW5sGY1sn21zlphRz7szklI/5JOGQa8BJqIdIGALwUAlDxzfXrwImhxYeoYvES
	Jdvjoi3Grpn431S0pzxhplgXUmt4xE0LigQXNfFU0yc33k4eJgX29bNn2vZuFP/0OKdRyza6LvY
	G7gTIyNS3kJn2wTYRxj8ZqIS+bMFroeBEjz3ZGOPqrf6f4TB5vM4VHOP9wCK6rDo3vA4bAlQM1f
	LOd57g90HJqt+m0ozayI1oI=
X-Google-Smtp-Source: AGHT+IGrFNgqCtuP/RBI4EcjgNA3Vq48ctIMRcUSVyuKbVOQfNfYYudUIDNFMLyI7B0LrPMhu9y66A==
X-Received: by 2002:a05:6122:322b:b0:517:83d1:d448 with SMTP id 71dfb90a1353d-51b75ac5d10mr2956116e0c.0.1735641550578;
        Tue, 31 Dec 2024 02:39:10 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68bb4297sm2658899e0c.16.2024.12.31.02.39.10
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Dec 2024 02:39:10 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-51878cf85a7so2871913e0c.0
        for <linux-riscv@lists.infradead.org>; Tue, 31 Dec 2024 02:39:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJWa5Fyu37IDHAIx14ZbPOevZ+Y2g4g6zb7Pri1NMeIrahFhGClAynT2ue31XZ0ZGbbVJbX8zomNyY4g==@lists.infradead.org
X-Received: by 2002:a05:6122:d04:b0:518:80fb:df24 with SMTP id
 71dfb90a1353d-51b75c3b88amr31384655e0c.3.1735641549850; Tue, 31 Dec 2024
 02:39:09 -0800 (PST)
MIME-Version: 1.0
References: <20241118155354.697411-1-valentina.fernandezalanis@microchip.com>
In-Reply-To: <20241118155354.697411-1-valentina.fernandezalanis@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Dec 2024 11:38:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW2vv5YGudOtU7fTMTafK-VAXqHhw2nFvG418-wavA0gQ@mail.gmail.com>
Message-ID: <CAMuHMdW2vv5YGudOtU7fTMTafK-VAXqHhw2nFvG418-wavA0gQ@mail.gmail.com>
Subject: Re: [PATCH v1] firmware: microchip: fix UL_IAP lock check in mpfs_auto_update_state()
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_023913_444838_2A28D029 
X-CRM114-Status: GOOD (  23.93  )
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

SGkgVmFsZW50aW5hLAoKT24gTW9uLCBOb3YgMTgsIDIwMjQgYXQgNDo1NuKAr1BNIFZhbGVudGlu
YSBGZXJuYW5kZXoKPHZhbGVudGluYS5mZXJuYW5kZXphbGFuaXNAbWljcm9jaGlwLmNvbT4gd3Jv
dGU6Cj4gVG8gdmVyaWZ5IHRoYXQgQXV0byBVcGRhdGUgaXMgcG9zc2libGUsIHRoZSBtcGZzX2F1
dG9fdXBkYXRlX3N0YXRlKCkKPiBmdW5jdGlvbiBwZXJmb3JtcyBhICJRdWVyeSBTZWN1cml0eSBT
ZXJ2aWNlIFJlcXVlc3QiIHRvIHRoZSBzeXN0ZW0KPiBjb250cm9sbGVyLgo+Cj4gUHJldmlvdXNs
eSwgdGhlIGNoZWNrIHdhcyBwZXJmb3JtZWQgb24gdGhlIGZpcnN0IGVsZW1lbnQgb2YgdGhlCj4g
cmVzcG9uc2UgbWVzc2FnZSwgd2hpY2ggd2FzIGFjY2Vzc2VkIHVzaW5nIGEgMzItYml0IHBvaW50
ZXIuIFRoaXMKPiBjYXVzZWQgdGhlIGJpdHdpc2Ugb3BlcmF0aW9uIHRvIHJlZmVyZW5jZSBpbmNv
cnJlY3QgZGF0YSwgYXMgdGhlCj4gcmVzcG9uc2Ugc2hvdWxkIGJlIGluc3BlY3RlZCBhdCB0aGUg
Ynl0ZSBsZXZlbC4gRml4ZWQgdGhpcyBieSBjYXN0aW5nCj4gdGhlIHJlc3BvbnNlIHRvIGEgIHU4
ICogcG9pbnRlciwgZW5zdXJpbmcgdGhlIGNoZWNrIGNvcnJlY3RseSBpbnNwZWN0cwo+IHRoZSBh
cHByb3ByaWF0ZSBieXRlIG9mIHRoZSByZXNwb25zZSBtZXNzYWdlLgo+Cj4gQWRkaXRpb25hbGx5
LCByZW5hbWUgIlVMX0F1dG8gVXBkYXRlIiB0byAiVUxfSUFQIiB0byBtYXRjaCB0aGUKPiBQb2xh
ckZpcmUgRmFtaWx5IFN5c3RlbSBTZXJ2aWNlcyBVc2VyIEd1aWRlLgo+Cj4gU2lnbmVkLW9mZi1i
eTogVmFsZW50aW5hIEZlcm5hbmRleiA8dmFsZW50aW5hLmZlcm5hbmRlemFsYW5pc0BtaWNyb2No
aXAuY29tPgoKVGhhbmtzIGZvciB5b3VyIHBhdGNoLCB3aGljaCBpcyBub3cgY29tbWl0IDQ4ODA4
YjU1YjA3YzNjZWEgKCJmaXJtd2FyZToKbWljcm9jaGlwOiBmaXggVUxfSUFQIGxvY2sgY2hlY2sg
aW4gbXBmc19hdXRvX3VwZGF0ZV9zdGF0ZSgpIikgaW4gdjYuMTMtcmM0LgoKPiAtLS0gYS9kcml2
ZXJzL2Zpcm13YXJlL21pY3JvY2hpcC9tcGZzLWF1dG8tdXBkYXRlLmMKPiArKysgYi9kcml2ZXJz
L2Zpcm13YXJlL21pY3JvY2hpcC9tcGZzLWF1dG8tdXBkYXRlLmMKPiBAQCAtNDAyLDEwICs0MDIs
MTAgQEAgc3RhdGljIGludCBtcGZzX2F1dG9fdXBkYXRlX2F2YWlsYWJsZShzdHJ1Y3QgbXBmc19h
dXRvX3VwZGF0ZV9wcml2ICpwcml2KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTzsKPgo+
ICAgICAgICAgLyoKPiAtICAgICAgICAqIEJpdCA1IG9mIGJ5dGUgMSBpcyAiVUxfQXV0byBVcGRh
dGUiICYgaWYgaXQgaXMgc2V0LCBBdXRvIFVwZGF0ZSBpcwo+ICsgICAgICAgICogQml0IDUgb2Yg
Ynl0ZSAxIGlzICJVTF9JQVAiICYgaWYgaXQgaXMgc2V0LCBBdXRvIFVwZGF0ZSBpcwo+ICAgICAg
ICAgICogbm90IHBvc3NpYmxlLgo+ICAgICAgICAgICovCj4gLSAgICAgICBpZiAocmVzcG9uc2Vf
bXNnWzFdICYgQVVUT19VUERBVEVfRkVBVFVSRV9FTkFCTEVEKQo+ICsgICAgICAgaWYgKCgoKHU4
ICopcmVzcG9uc2VfbXNnKVsxXSAmIEFVVE9fVVBEQVRFX0ZFQVRVUkVfRU5BQkxFRCkpCj4gICAg
ICAgICAgICAgICAgIHJldHVybiAtRVBFUk07Cj4KPiAgICAgICAgIHJldHVybiAwOwoKV2h5IGlz
IHJlc3BvbnNlX21zZyBub3QgYSB1OCBwb2ludGVyIGluIHRoZSBmaXJzdCBwbGFjZT8KCiAgICAg
ICAgdTMyICpyZXNwb25zZV9tc2cgX19mcmVlKGtmcmVlKSA9CiAgICAgICAgICAgICAgICBremFs
bG9jKEFVVE9fVVBEQVRFX0ZFQVRVUkVfUkVTUF9TSVpFICoKc2l6ZW9mKCpyZXNwb25zZV9tc2cp
LCBHRlBfS0VSTkVMKTsKClNvIEFVVE9fVVBEQVRFX0ZFQVRVUkVfUkVTUF9TSVpFIGlzIHRoZSBu
dW1iZXIgb2YgMzItYml0IHdvcmRzLi4uCgpIb3dldmVyOgoKICAgICAgICByZXNwb25zZS0+cmVz
cF9zaXplID0gQVVUT19VUERBVEVfRkVBVFVSRV9SRVNQX1NJWkU7CgphbmQgZHJpdmVycy9tYWls
Ym94L21haWxib3gtbXBmcy5jOjptcGZzX21ib3hfcnhfZGF0YSgpOgoKICAgICAgICB1MTYgbnVt
X3dvcmRzID0gQUxJR04oKHJlc3BvbnNlLT5yZXNwX3NpemUpLCAoNCkpIC8gNFU7CgpzbyByZXNw
b25zZS0+cmVzcF9zaXplIGlzIHRoZSBudW1iZXIgb2YgYnl0ZXM/CgpTZWUgYWxzbyBkcml2ZXJz
L2NoYXIvaHdfcmFuZG9tL21wZnMtcm5nLmM6Om1wZnNfcm5nX3JlYWQoKToKCiAgICAgICAgc3Ry
dWN0IG1wZnNfbXNzX3Jlc3BvbnNlIHJlc3BvbnNlID0gewogICAgICAgICAgICAgICAgLnJlc3Bf
c3RhdHVzID0gMFUsCiAgICAgICAgICAgICAgICAucmVzcF9tc2cgPSAodTMyICopcmVzcG9uc2Vf
bXNnLAogICAgICAgICAgICAgICAgLnJlc3Bfc2l6ZSA9IFJOR19SRVNQX0JZVEVTCiAgICAgICAg
fTsKCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0t
IApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMy
IC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRh
bGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5n
IGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2
YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
