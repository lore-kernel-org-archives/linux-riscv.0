Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CADE77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 04:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K4AQNsC3dNlZQSoBd6Yhi6YRJa0GABEdwcH37X8mpvI=; b=nP9AgVVxqiSckB
	KE2bwf6OCyoa/eipez4Xpv5SAioTDa/vlAeVcOpVqosr7X/+I7G7xPFHVI7Twpuoc6ONUEVJIelDU
	vfwdJsZ5UX0vywc9gQae4AtFdlGDQk/Toyu6A2V8Y0TcMlOtEsaBquEOZcChdUQBWdR+M++GJJnEv
	yTLT2paBnhxoqoH0vHJxu33UHDC0z281PqZJWex3l7WWfO7PvxVQDBqHSgundo2xuzszRQwml8FxY
	Uz+Ad7VJvKNZ3ZIhIVlht7t7/1WAh9/EeWOKdeK0Qnb9xbdO1YNB8fGMxGP+wZpIQNnSwWTUxuvqo
	Po1eM1x/u7Gg+SSK+g3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXYdL-00000007RHA-34yd;
	Tue, 14 Jan 2025 04:34:31 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXYdJ-00000007RFb-15VO
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 04:34:30 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3cdce23f3e7so38377665ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 20:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1736829268; x=1737434068; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pyMTdTlbof+2fRMJfZoa2kuAC3CeqJnAyOkl+fpJmg=;
        b=WvcrD8bjRJMdDWzZQyzR2mpsyHjDLnU3NvBOT2YwXwfY940dFbXxpaG78ovxWW8zqM
         1VoHe3g+VRtlNTZHCS6mXCK4ldXWGZnTqWVAYFUva5wlhPD1Xb+/QNBaG/RxnyTijjA7
         AhpsYS7jRCmKAMKcMauIJ/+2Z5t8/5TR0gMJoZ5Rejj5V1ZnwGFGBECKMMR+xGz3i61g
         wfmB9aAXKcLJ+tA9K2iNOTVTjhHY4bk65ObCttoHjJC4Qa69BoPY01u5mYmcw99WmABu
         OR4NuOXuwHgChDc7JTKY9l1QEPpxf3ZDD/BbHP//vTw5DM01K68svflcMAzdmPJnoVZw
         s9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736829268; x=1737434068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7pyMTdTlbof+2fRMJfZoa2kuAC3CeqJnAyOkl+fpJmg=;
        b=cXR/8tmPyv3ERSBKr2oBn6ln6Gp86D45CoO4qtkLivkhIj6pa8J9K576d9TVVVSPZj
         CLb6R31AIJyZR85ntjyiIB43eTiv3yy0dMtCQwTwzx/jsLxC40jtKcpkyZqnmdbv4UDZ
         cHC+SMSyfB84A4ydce6y3IRqs5w5UvnWHbaQNxDB+cQ+p3zgd5odj+eizD8z7soeTcef
         iC+4QqWTLDbv1V2ebXTLO72uHRM9klvBFSaxBzsaTArQVjZzo7yRmSbLpb1ewjUmlalr
         vw1PRmccwn4sKzaCPYwtgHiCa6Rz2elblPUZT99YGiIq9pun1L0L977yCpY9Wrs6nIW8
         Rj9g==
X-Forwarded-Encrypted: i=1; AJvYcCXPeDSL/1E4aT3DPkOztsFOzkwGc/vdxJeiaSCpx4OThzNDDJjRZp939OJSSJ/3YX4aDMlVECYEXrEV4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZEasQCkzZACE0aiMLv9qAPPTFUPd2ASLz/JwhjyW0tUsXyVRk
	9TGdtvkxX8GHYXG2TFqHIJjB2bogC7z/yZ/XX0YSYhOTmEz/Tcq6G18Bz8UFztWn3VyyPOscUrE
	eA8/hjYIywhqbf58Y7+6ow3HkYDTmKLaQichK0sGaupBVWdvqRNU=
X-Gm-Gg: ASbGncsb6V6bBI4C4jqjyXFJm7hq958MpJUrXUt4liMNIQHNpI0Qir7gqa7epW/UlnJ
	UuMMiP0ZQ7Gnhzi6mIq9o89PCU3qABNas36DXSqw=
X-Google-Smtp-Source: AGHT+IFdVUBr5TUtLLGgudKqBNGBBq6ZaGY/gU8+m3MZ/ClWsExZA7KtLc9JJrslYZ798lk/1zKlcrENioUAbpOKm0M=
X-Received: by 2002:a05:6e02:3048:b0:3a7:6a98:3fdf with SMTP id
 e9e14a558f8ab-3ce3a9da817mr183236145ab.14.1736829268254; Mon, 13 Jan 2025
 20:34:28 -0800 (PST)
MIME-Version: 1.0
References: <20250113150933.65121-1-luxu.kernel@bytedance.com> <20250113150933.65121-6-luxu.kernel@bytedance.com>
In-Reply-To: <20250113150933.65121-6-luxu.kernel@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 Jan 2025 10:04:17 +0530
X-Gm-Features: AbW1kvY1tJpfKOIUgE1Z0WOIftQljKWnBoD1Tego8I6ylHJg1RIdFJ55P_A930k
Message-ID: <CAAhSdy2Z-ebp0fG=Y=VTO35cPnCa56JPi5cQ3bmyL3UMhLX4iQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] irqchip/aclint-sswi: Use wmb() to order normal writes
 and IPI writes
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, lihangjing@bytedance.com, xieyongji@bytedance.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_203429_296837_0947D525 
X-CRM114-Status: GOOD (  14.72  )
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

T24gTW9uLCBKYW4gMTMsIDIwMjUgYXQgODo0MOKAr1BNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IER1cmluZyBhbiBJUEkgcHJvY2VkdXJlLCB3ZSBuZWVkIHRv
IGVuc3VyZSBhbGwgcHJldmlvdXMgd3JpdGUgb3BlcmF0aW9ucwo+IGFyZSB2aXNpYmxlIHRvIG90
aGVyIENQVXMgYmVmb3JlIHNlbmRpbmcgYSByZWFsIElQSS4gV2UgdXNlIHdtYigpIGJhcnJpZXIK
PiB0byBlbnN1cmUgdGhpcyBhcyBBQ0xJTlQgU1NXSSBpc3N1ZXMgSVBJIHZpYSBtbWlvIHdyaXRl
cy4KPgo+IFNpZ25lZC1vZmYtYnk6IFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXRoZWFkLWM5MDAtYWNsaW50LXNzd2kuYyB8IDYg
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2lycWNoaXAvaXJxLXRoZWFkLWM5MDAtYWNsaW50LXNzd2kuYyBiL2RyaXZlcnMv
aXJxY2hpcC9pcnEtdGhlYWQtYzkwMC1hY2xpbnQtc3N3aS5jCj4gaW5kZXggYjBlMzY2YWRlNDI3
Li43MjQ2YTAwOGEwZjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS10aGVhZC1j
OTAwLWFjbGludC1zc3dpLmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXRoZWFkLWM5MDAt
YWNsaW50LXNzd2kuYwo+IEBAIC0zMSw2ICszMSwxMiBAQCBzdGF0aWMgREVGSU5FX1BFUl9DUFUo
dm9pZCBfX2lvbWVtICosIHNzd2lfY3B1X3JlZ3MpOwo+Cj4gIHN0YXRpYyB2b2lkIHRoZWFkX2Fj
bGludF9zc3dpX2lwaV9zZW5kKHVuc2lnbmVkIGludCBjcHUpCj4gIHsKPiArICAgICAgIC8qCj4g
KyAgICAgICAgKiBFbnN1cmUgdGhhdCBzdG9yZXMgdG8gbm9ybWFsIG1lbW9yeSBhcmUgdmlzaWJs
ZSB0byB0aGUgb3RoZXIgQ1BVcwo+ICsgICAgICAgICogYmVmb3JlIGlzc3VpbmcgSVBJLgo+ICsg
ICAgICAgICovCj4gKyAgICAgICB3bWIoKTsKPiArCgpTYW1lIGNvbW1lbnQgYXMgUEFUQ0gzLgoK
VGhlIHRoZWFkX2FjbGludF9zc3dpX2lwaV9zZW5kKCkgaXMgY2FsbGVkIHRocm91Z2ggaXBpX211
eF9zZW5kX21hc2soKQp3aGljaCBkb2VzIHNtcF9tYl9fYWZ0ZXJfYXRvbWljKCkgYmVmb3JlIGNh
bGxpbmcgc28gbm8gbmVlZApmb3IgYW55IGJhcnJpZXIgaGVyZS4gQWxzbywgYmFycmllcnMgbmVl
ZCB0byBiZSBpbi1wYWlyIHNvIGFkZGluZwphIHNpbmdsZSBiYXJyaWVyIGF0IHJhbmRvbSBsb2Nh
dGlvbiBpcyBpbmFwcHJvcHJpYXRlLgooUmVmZXIsIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2tlcm5lbC9pcnEv
aXBpLW11eC5jP2g9djYuMTMtcmM3I243OCkKCkJhc2VkIG9uIHRoZSBhYm92ZSwgdGhpcyBwYXRj
aCBpcyBub3QgbmVlZGVkLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
