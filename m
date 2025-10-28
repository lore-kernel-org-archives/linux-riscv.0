Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652CDCCF9E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 09:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/k7kUVTXe7JHY+TnV0c+np/2+syYoWDKakSP68x0UY=; b=HtquCZ7Jd4Kviq
	7IkXoOuZOQT9VPtao10KKbnG2gRH5gvCHD/b72NMnwRSJXM6fbjJPk8we7UkrG9h7D0V07Yfh8K+X
	3O1+aanfMSEdXPNZTiwYmZScXMW+hkOGtJOOQIT9RfLvhnIoLo7SWlBmn9b6nmQC19P6w9ynT1bZr
	eBJAD4wAxDT8TOWr0YlFilJUDX1FaHfRVak1lsbpCg03DDsN8twBhbZvs42SxBf+23mX92zpQb2aP
	jpAonoDjZCz+0Y+dfhH58EPIx9/L22hZ5Xl4PASGCKtDMi+0sqCHIpoRv864EfofSenUnWjGwvLAd
	b+qfSWcW4Hdy0Uormrgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgTg-0000000Fhqy-1yR5;
	Tue, 28 Oct 2025 09:58:56 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgTe-0000000FhqV-1nZz
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 09:58:55 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-940d25b807bso236397339f.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761645533; x=1762250333; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PY8mCSuKOhJf2Q+W5FTads5NFbSblIDSqg2ZyPdi2M=;
        b=V1/9RwZxayz9KvK7qsPRmBd2uf1NcwbIWVcMKygVjUzFS4pOUa1uPVPR1Lkkds4UnH
         p2VL0TukNytELbi4TjvtUwLN1YgJ0FcAkJk2yGdATpJ77PKnwFgiZ4xzq6k/lyH4smNj
         qQE2HqrswVHfAHGcqBvBVyuVWmIkshCkeBCxivzbrU+yZ/arxzNYs+jP8svNL0c36QIb
         4K8hgBh1O4aN3xFV/roTfkxP2Ay7uG3/aMOOiN3uoH9yX8ao5Y8eb80JA71LOjoRMjXq
         hmwJsgDcC+e2sDDB1qx9rvSvdkl7jn6cCUp31gMTV1bPU0xn8/RXCFJfFCMudrvR3OCl
         1flQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761645533; x=1762250333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1PY8mCSuKOhJf2Q+W5FTads5NFbSblIDSqg2ZyPdi2M=;
        b=CMXecHG5K7cZ3we/KW7qHwKZSdFcnDP7HouSSqMZnhUDji85nkawwPmWNZBXW035F6
         1EQsR+IKTSwGeRjNA9B0M1ND8RdES7C+d0y4nb+8zcDOKLi16WXPMaVfXecTkX4PsJmz
         X4ixeBz4hmq/SJjdfeqiDVDJ35beg8zBho16RQG8vtHM8B86en7Y8Eck5YSmX10vuFrI
         MZADGbaywW+J31/ZHlshIId4lmBa/+kZYQJ08EzFKcTuB8cpdIkRVB3JnbddvK2q9gF5
         QI18v5YY/GTuK6FPJ7JDL2Mr4vVftoeillE2eQMFRwAB1KI+fGimF7+yyyOM/lGrXGn5
         v3iA==
X-Forwarded-Encrypted: i=1; AJvYcCWGLYy2AOtDutheZgOL+wLs9XZBexzTb3QR4pfNNsUbDdpCv7se8R3h70ZHqRlW7l1nHLgSGV5Xq/duAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnU2WeHC867C8NnuAipK3pFP8MoX0+y4Y4qEYfprD0CRkFxwj4
	Z/aUwJyCzqw+v0ImqYBIBNCtJnwjBh8xGRKmqxxDGVOp2nTspXrS61gXXk9Fez0lJyHnb2PVUcQ
	Fumiia3vH2+o9sGlbnq1o8Kl/DoHJZz4rh41KIs9HMg==
X-Gm-Gg: ASbGncvKJuSj8Llgf9xqJZxk5bTMQZ/BM4DpJxATqs/NGb5jfe41+GeJaWguHsGr+62
	vQx6+zZMyMEVnRTmyrP54hPXcDMSItu3bqyid5b/ozyy8oKvFey14bb+xlbHraudPA+HTytpPlT
	rYEOl9ExYZ9RKhZ/DWmvyIoe9A3mwPKbfHpkeIwRASE5yk77rCjB02KHBPflK33hBZELhcfBYuz
	bryTQslrEgRjVWvkV224DNW+Gyjv6XTjbsuXR5bDty2iv6C0lzwcWEqcZsfisAokxNm+V1GLQyk
	e4RA/KBClfQjosW/LQ==
X-Google-Smtp-Source: AGHT+IEg0a1CT3cJ1oaHQ17yWX2472MdL2RHimICjHVP34ZQDjWMsWJJoe7Ni16kwKdyIqohFYWx2NwOzODq5cmzegw=
X-Received: by 2002:a05:6e02:d:b0:431:d73b:ea9c with SMTP id
 e9e14a558f8ab-4320f6b1237mr44673025ab.6.1761645533137; Tue, 28 Oct 2025
 02:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20251021135155.1409-1-thorsten.blum@linux.dev> <20251021135155.1409-2-thorsten.blum@linux.dev>
In-Reply-To: <20251021135155.1409-2-thorsten.blum@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Oct 2025 15:28:41 +0530
X-Gm-Features: AWmQ_bmouff25xtnvPr1URYNqHRT10uCqQrPn__6ZXy4Z26vl234qADpGcUh16E
Message-ID: <CAAhSdy2Y25TXjZNmaMMKhwZBi-T-UzXjQGuVfqy-ThTuJ4rmNA@mail.gmail.com>
Subject: Re: [PATCH 2/2] cpuidle: riscv-sbi: Replace deprecated strcpy in sbi_cpuidle_init_cpu
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_025854_708846_3A2D0CE7 
X-CRM114-Status: GOOD (  13.25  )
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

T24gVHVlLCBPY3QgMjEsIDIwMjUgYXQgNzoyMuKAr1BNIFRob3JzdGVuIEJsdW0gPHRob3JzdGVu
LmJsdW1AbGludXguZGV2PiB3cm90ZToKPgo+IHN0cmNweSgpIGlzIGRlcHJlY2F0ZWQ7IHVzZSBz
dHJzY3B5KCkgaW5zdGVhZC4KPgo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9LU1BQL2xpbnV4
L2lzc3Vlcy84OAo+IFNpZ25lZC1vZmYtYnk6IFRob3JzdGVuIEJsdW0gPHRob3JzdGVuLmJsdW1A
bGludXguZGV2PgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1
bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUt
cmlzY3Ytc2JpLmMgfCA1ICsrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUt
cmlzY3Ytc2JpLmMgYi9kcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1zYmkuYwo+IGluZGV4
IGEzNjBiYzRkMjBiNy4uMTliZTY0NzVkMzU2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY3B1aWRs
ZS9jcHVpZGxlLXJpc2N2LXNiaS5jCj4gKysrIGIvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlz
Y3Ytc2JpLmMKPiBAQCAtMTgsNiArMTgsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+
Cj4gICNpbmNsdWRlIDxsaW51eC9vZi5oPgo+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ICsj
aW5jbHVkZSA8bGludXgvc3RyaW5nLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZp
Y2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BtX2RvbWFpbi5oPgo+ICAjaW5jbHVkZSA8bGludXgv
cG1fcnVudGltZS5oPgo+IEBAIC0zMDMsOCArMzA0LDggQEAgc3RhdGljIGludCBzYmlfY3B1aWRs
ZV9pbml0X2NwdShzdHJ1Y3QgZGV2aWNlICpkZXYsIGludCBjcHUpCj4gICAgICAgICBkcnYtPnN0
YXRlc1swXS5leGl0X2xhdGVuY3kgPSAxOwo+ICAgICAgICAgZHJ2LT5zdGF0ZXNbMF0udGFyZ2V0
X3Jlc2lkZW5jeSA9IDE7Cj4gICAgICAgICBkcnYtPnN0YXRlc1swXS5wb3dlcl91c2FnZSA9IFVJ
TlRfTUFYOwo+IC0gICAgICAgc3RyY3B5KGRydi0+c3RhdGVzWzBdLm5hbWUsICJXRkkiKTsKPiAt
ICAgICAgIHN0cmNweShkcnYtPnN0YXRlc1swXS5kZXNjLCAiUklTQy1WIFdGSSIpOwo+ICsgICAg
ICAgc3Ryc2NweShkcnYtPnN0YXRlc1swXS5uYW1lLCAiV0ZJIik7Cj4gKyAgICAgICBzdHJzY3B5
KGRydi0+c3RhdGVzWzBdLmRlc2MsICJSSVNDLVYgV0ZJIik7Cj4KPiAgICAgICAgIC8qCj4gICAg
ICAgICAgKiBJZiBubyBEVCBpZGxlIHN0YXRlcyBhcmUgZGV0ZWN0ZWQgKHJldCA9PSAwKSBsZXQg
dGhlIGRyaXZlcgo+IC0tCj4gMi41MS4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
