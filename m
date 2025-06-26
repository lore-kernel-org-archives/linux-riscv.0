Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B64C7EE30
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 23:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+CTfMwSGedh+6mdpFft7HhI83tIw86t2YzIVIinNXg=; b=WSsjMiNpkbkUBW
	32kxkiMBtECqmSzK34LsZssKNuIsa6yY4m2ELd9rX7rDbpVa2uhozG6VHm4RvEvV1lYRLAfRKVBBO
	/+1Tf2LipgeMRZvZfT89P0tc65KqhNeAjRjh7HuBkV1Dmlifv7UAzcHe7xztATFiu3SoJws+97j6G
	vuAtX18T+6voB+IBpLFS+4AhQtm7vX9LYc23f2TySt6QkMUQVGbjW105FruoIRHFPp3tB0AuhkJvq
	/h8rdk4A0ROzoC1hZFCwvfH6YvdLDhazFt7LUaAWPPuXwaO4RFAoFuMplAwPbDeBgubWby6z0W6yU
	q8608OTDDbWBKz+XRLDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwHT-0000000D5X6-0h1R;
	Thu, 26 Jun 2025 23:45:23 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUuQj-0000000Crl4-2RY5;
	Thu, 26 Jun 2025 21:46:50 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-532de49b7e2so453629e0c.0;
        Thu, 26 Jun 2025 14:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750974408; x=1751579208; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWuNAXCk1fWueV9/KkSjE2Q70mMkCujHcS2z91+7Wzo=;
        b=MpbBhbXgx9vVqs8cgt8LWO1D/XhuTxFo26uVvE2fFFP7J9QOpQWl3thT39EQpCge/Y
         EOVQNjM3H75d8HCljoAgo3KawgEUbHQlG0Gbf8dfCmNxWewArkyKDGRcF18ZWDSTZNV4
         JWEAUrXxW9S0Qp+EFYFwRzCIo7djRFkRP3jkTIZF/YvGN6IsdxSfygFPSkLCs97rKTb/
         vSPpJ8y5d6Izl0gmQbXTkpeQVsruZLWaIPqfrkHivkMJ6K2UVyg0l6hIu9dmgADRGOkJ
         xp2E8S0t5vb56EaJLIeTwTiG5hgsMY/+K+As8ATp0Csp/vNPNpE5t4rOZY8R0QHESw33
         SC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750974408; x=1751579208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWuNAXCk1fWueV9/KkSjE2Q70mMkCujHcS2z91+7Wzo=;
        b=NiiiWb1K5zuHn3BGzkCEI9VppTwmSpCRdfC2tH4hC5raYm4CKdeYq5+6HovLOm6N54
         Gx6LB36ORX+8smxLQDXdIsJMDJl2cQqFUfyfihBnD5saAHeu0u2ZhhEE9Pn4NB+OfM2a
         NqqAq68bbbbk0fdRYq6hvtx47m56HJX/wgFRgtu6JyuXd62xmIDduVDYuwCwz3qYcmeR
         5D5xYPURz4a6oQNElz+uavJiHUg2V5/oy7q4sEzL4Q7zJ5YhUdZFrKLzLq+NY1LR+hWA
         mBixhN+l/010ysLmcsYcgkwU0fqWPcqarGRxag8xwtOCYLm5ROxmq3K7qk2sySjlmye9
         r0pg==
X-Forwarded-Encrypted: i=1; AJvYcCUU5a5w1CrDEE0hWglCI0gTsO34IPbTyfhGyZNj7J/ekuAPuN89aAZffdBhERAYNihDQELjDuqsPkzWK/zFKjdJ@lists.infradead.org, AJvYcCXZx4dfIXS4sRsJJmT7W5fjoROQ58+alJdWxlIG6Ov1Dac5sWMsBecCHlEDKYf52ZjcuVAFm/kBV5UwGI8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+YEk/l6p40frhwa38cc+GuqmYyFnfUh3SEsQ32Bzdz2vj5B94
	+1kZXx3YS/ZPxlujxBjMmLed2mJDB+P21tBbKpIX5LWRVhXGt9zx37u8CAwQiawW96sjytpZcPP
	utxklH7L3FbKe8aODoMeeXBYdy0pAOq4=
X-Gm-Gg: ASbGncvB1JvhldI7K+FJxW3Ul9U5PvR5GCFwdVlfQC72OJ5kFZ180UzyFAVbS8Y2VgP
	HW/0pFfuUwRmn7sF9NjboG09ALKzJVnhw9W8pXxNrVgC9B7AyKQ2NAOX8C2tAt5wWWMV2tzWiK9
	kbXWulb+caASGBp0WTlaCKnSVIVG0AR/iqW9ZlSYAjSlQ=
X-Google-Smtp-Source: AGHT+IFqD6MeHf2dv8GNgWuXZnCWkBT5zbKZdT0Fqn22cE5696tU3bF1FiIJc/HEpUJx4mMUyCJENSCCX6BXL3RgS4w=
X-Received: by 2002:a05:6122:501b:20b0:531:4708:3d45 with SMTP id
 71dfb90a1353d-5330c0bf774mr582169e0c.10.1750974408037; Thu, 26 Jun 2025
 14:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <a5b5b0aa-21c4-4abf-b323-63af96aabcd5@redhat.com> <20250626092905.31305-1-ioworker0@gmail.com>
In-Reply-To: <20250626092905.31305-1-ioworker0@gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 27 Jun 2025 09:46:37 +1200
X-Gm-Features: Ac12FXylRE3hZva5QKBERz9CcinWRMXOAb6qrHlm_KOUdTJ8v1xSbRPfHA-4N7M
Message-ID: <CAGsJ_4w5Obx9=P0wkrbLaDzKpG0e-7xs7jgHRa91KO7e92MO8g@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Lance Yang <ioworker0@gmail.com>
Cc: david@redhat.com, akpm@linux-foundation.org, baolin.wang@linux.alibaba.com, 
	chrisl@kernel.org, kasong@tencent.com, lance.yang@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_144649_619728_382E56BA 
X-CRM114-Status: UNSURE (   8.09  )
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

T24gVGh1LCBKdW4gMjYsIDIwMjUgYXQgOToyOeKAr1BNIExhbmNlIFlhbmcgPGlvd29ya2VyMEBn
bWFpbC5jb20+IHdyb3RlOgo+ClsuLi5dCj4gKwo+ICsgICAgICAgICAgICAgICAvKgo+ICsgICAg
ICAgICAgICAgICAgKiBJZiB3ZSBhcmUgc3VyZSB0aGF0IHdlIGJhdGNoZWQgdGhlIGVudGlyZSBm
b2xpbyBhbmQgY2xlYXJlZAo+ICsgICAgICAgICAgICAgICAgKiBhbGwgUFRFcywgd2UgY2FuIGp1
c3Qgb3B0aW1pemUgYW5kIHN0b3AgcmlnaHQgaGVyZS4KPiArICAgICAgICAgICAgICAgICovCj4g
KyAgICAgICAgICAgICAgIGlmIChucl9wYWdlcyA9PSBmb2xpb19ucl9wYWdlcyhmb2xpbykpCgpE
YXZpZCBhbHNvIG1lbnRpb25lZCBpZiAobnJfcGFnZXMgPiAxICYmIG5yX3BhZ2VzID09IGZvbGlv
X25yX3BhZ2VzKGZvbGlvKSkuCkkgYXNzdW1lIGl04oCZcyBzdGlsbCBmaW5lIHdoZW4gbnJfcGFn
ZXMgPT0gMSBmb3Igc21hbGwgZm9saW9zPyBObz8KCj4gICAgICAgICAgICAgICAgICAgICAgICAg
Z290byB3YWxrX2RvbmU7Cj4gICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICB3YWxrX2Fib3J0
Ogo+IC0tCj4KClRoYW5rcywKTGFuY2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
