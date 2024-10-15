Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AADD1D88B
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 16:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=An05qKLRFfdKXiHwCb6zKkW/ydSQBekP/nAVq6gN6qk=; b=E0P4lO6reOXJjI
	cmBI2EVb9ciLQJTkeEEZUN1iJ6HU3L1ZYnPFQxbKcxQqocj/Rc/gVRuH0mOTrrHPfjpELPiPx/ujv
	k0p2HnD89Dt2a1kmjMTaDqlObdXbLFMCU1F4ZXIaXjCekDtFj6jfQL+CkFLPBXPU/UW2miJGpFQuW
	gyMyjYu0saxNd+uXMR9uiiPSjAX7C83FLPjOQUuJMjeX17Y915o4vlrpjTKSL0MXC0x2yQgh6zHim
	Wa+WBvMhhyB1t0joP0/DIoFkT4vEqi2rGNSIPKJTGjs2GAZCTmDS8iiAGaY86fsozNLNGxKfOBiOq
	Gk7XKZF3JX4d19MbXeZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0ktc-00000008xkM-1BOP;
	Tue, 15 Oct 2024 16:59:44 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0kmr-00000008wVk-35VQ
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 16:52:48 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-20cceb8d8b4so266045ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 09:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1729011164; x=1729615964; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n3Db9KNu24mZIxh4KZt+GqF8LG8v2I1eNvYK+pyP8rY=;
        b=Rxjs07CdQ1uFBb7EGlAmG0lhiBcVc8GAO/S9f0LvEMBHiKp2zoyxeUguJQq0WLw+Qv
         Ullsf2vZHGURWs9Qe9RpfDj8e76z9lVFvKzWuFxR73lTB1MRIe3qcxn8NiYJHugvRef6
         vACpMhXg3DTV02R8EymQ0H9wRFXgzu4W3lefmTwaEb/JbHL8OKKOuBlTURs0Spz349T7
         c2Z+jAJmJdEPPREgRBBjfMZg+CyUW+mNOde2k/ejx92smq+HvXzcdVivih4ZWYXytAko
         A+KdEjmNHEiA/0qWZBtWwxyGzuHkrYZ3JnPeC41kreDS7AdnYWDwA0RXRfUbKOhExJ9A
         ycVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729011164; x=1729615964;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3Db9KNu24mZIxh4KZt+GqF8LG8v2I1eNvYK+pyP8rY=;
        b=ZWO+K+ybWDTwHMY1rqB6fulDwgiw1Ium96iIj/uh0xv3uDYQ55n/aiCipY8u96U+KG
         RJg5k/rSxhXSSlbMPViz7o1Agydn7w0QMW3D3T+Mc3vMUuFXdBLhnOCXiEQvusnWwHyn
         CTeftnY6rsxQC/+2NSGCEmdfwZ+6O12W2yNhOOLHrWFo643WeiJMjQ9zEhSqSSD2hboU
         3sBJB6KwWdUmRd9rXjrxS/wPQIE4GzKwnXz+IIa/bzWE6zugUTEfS3Ut47SBh5noEitt
         EeCkHqFC1yg1PDeiHGf11C5Eeh/4fP7nTj9l5qeiajQ1ZFBC7Bg9bY6sXt/D3Tp2nuON
         Z4ig==
X-Forwarded-Encrypted: i=1; AJvYcCVV5TQkUHJGpsV6cpHY4nu2ji0MSJcZtzqNt9FJl5gBGAId07LdwICHRU3CG54rG6F9xXT0JVxIxOSfpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDzuHeHbaacgg60nEsO+O5YZUgwh093PgWAlgRrVv8kkIk3E8O
	SEKD0NzP2JEasAfz3UQHQ8bCZ6XCyxYOUZGRCht4+7z/WDId13Kzl9+QmLeN4QU=
X-Google-Smtp-Source: AGHT+IFSlc9Do3e06c9RaVzUfb0DboIMep1CPB/fwkRtIHhmDfcSAMhRUZD8wx8h7C68xav+nrU4SA==
X-Received: by 2002:a17:903:186:b0:20c:f39e:4c04 with SMTP id d9443c01a7336-20d26f9f1e9mr17187005ad.2.1729011164389;
        Tue, 15 Oct 2024 09:52:44 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f844f7sm14225495ad.60.2024.10.15.09.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 09:52:43 -0700 (PDT)
Date: Tue, 15 Oct 2024 09:52:41 -0700
From: Drew Fustini <drew@pdp7.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: Re: [PATCH v1 0/3] pinctrl: th1520: Unbreak the driver
Message-ID: <Zw6d2T54M2GptYiy@x1>
References: <20241011144826.381104-1-emil.renner.berthing@canonical.com>
 <CACRpkdayc=5ee_D-t_xpOe3hSNHKDYN63J_6WO0HECNUH36hrg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdayc=5ee_D-t_xpOe3hSNHKDYN63J_6WO0HECNUH36hrg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_095246_133658_4A8A1C80 
X-CRM114-Status: GOOD (  11.90  )
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

T24gRnJpLCBPY3QgMTEsIDIwMjQgYXQgMDk6Mjg6MTBQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBGcmksIE9jdCAxMSwgMjAyNCBhdCA0OjQ44oCvUE0gRW1pbCBSZW5uZXIgQmVy
dGhpbmcKPiA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4gCj4g
PiBIZXJlIGFyZSAyIGltcG9ydGFudCBmaXhlcyBhbmQgYSBjb2RlIGltcHJvdmVtZW50IHRvIHRo
ZSBULUhlYWQgVEgxNTIwCj4gPiBwaW5jdHJsIGRyaXZlciB0aGF0IHdhcyBlaXRoZXIgaW50cm9k
dWNlZCBvciBtaXNzZWQgd2hlbiBEcmV3IHRvb2sgb3Zlcgo+ID4gdXBzdHJlYW1pbmcgaXQuCj4g
Pgo+ID4gSXQgaXMgYmFzZWQgb24gTGludXMnIHBpbmN0cmwvZm9yLW5leHQ6Cj4gPgo+ID4gICA2
ZGJkMTU3N2I3ZGMgKCJNZXJnZSBicmFuY2ggJ2RldmVsJyBpbnRvIGZvci1uZXh0IikKPiAKPiBB
bGwgcGF0Y2hlcyBhcHBsaWVkIQo+IAo+IFlvdXJzLAo+IExpbnVzIFdhbGxlaWoKCkhpIExpbnVz
LAoKV2hpY2ggYnJhbmNoIGRpZCB5b3UgYXBwbHkgdGhlc2UgcGF0Y2hlcyB0bz8KCkkgZG9uJ3Qg
c2VlIHRoZW0gaW4geW91ciBkZXZlbCBicmFuY2ggWzFdLgoKVGhhbmtzLApEcmV3CgpbMV0gaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbGludXN3L2xpbnV4
LXBpbmN0cmwuZ2l0L2xvZy8/aD1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
