Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24537E7AD72
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 15:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0MzNYcS4h3+j0KgK2FOd2FIKTrwhr4o5PGzqUex0+w=; b=i/2tjuHh/OlKoo
	Tuks3onlczbAzqOYcPL0w0IpXO0jAghJxRvBFMndb4C+PkZomnobspydPX+QraviOjWbr7el0bDBW
	J0nbm84LzgfqMr9ovkVGMWrohrEk2LlG6T8zMO26TpZNPCpKPJi5e9fHzVNqHAVmiGFO3JJASiERa
	7PGdJx4ABYldEHsSMhvNGPmtg7ILtuIFBiwKjrsrSLyOVWZEd7LL+j4UigCnNiCPxapIwkmOfG3IV
	tMpuqYdxZn7gXYpnmHThZgWQfeLWQ7y6CG6oGYgz/4YvDUdS2i7du2jpdFa+RzYD9CiYq09BzNq9Y
	qcX9XDv7mVDCNZh/4KEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnhUt-00EtXw-06;
	Tue, 03 Oct 2023 15:39:43 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnhUp-00EtXT-2W
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 15:39:41 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50437c618b4so1307541e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 08:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696347578; x=1696952378; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ExDWs22CqouqpPu+z2OTT2+Lny2f2DrlLFQpikfKgc=;
        b=JGQOBBVzYuN9T7vG34rClyLfgk8++Fv29Y5WhLTCADehh+BGQPdHUU6EWUoHgd5nwv
         QwgwK+6Z+kZYxNYZ0UwnNd1RPOSuSAs0W+gFTDY8/ha/vD+LbOqzaUyZ0xP0DDKo2a4+
         FBcNI6dglQjZL/5TJ3gTkRfBunLnG/AK9MSIaSr8mL6ZOyrdKvxaiJSnpzus7ewdVDWP
         2gbWXr6vhmqg0+zK3/1N+es0CTuvwpUGort4C4yr2GaWgmcY6BQmnvXEUmnRtu1eN86u
         fkmPVIkr77cWkdwKwktphfzN9mPKBwltujDW3rMKExiEddnC5u19Qg9iFgxPee6YsY84
         qyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696347578; x=1696952378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ExDWs22CqouqpPu+z2OTT2+Lny2f2DrlLFQpikfKgc=;
        b=lpYldmEsRXWFvrGmt+ysvFypYgMhHJC+G5no1LDx6tHnTXYduVRQj/trN2YWYGEXCa
         37w8+Aw6zv1+F8P09WPnEh17XUWVlqjMi7jpXzS7H0jtSICUbSV6bnrMM6CkeutKSxTz
         BFCy4XO7y//XP8LAS8hNyOaic9tbFO+Zm79kMUWqGx3k6+sydTom/6ygqKnpo5AOP58x
         2uxbCkK3uAb2DeuBemGpdUoaha9DxT4Zxu7zjzWtk2Biyp+rfeUNxypa4104yldWE80a
         k4ZeQNcnS21a5b/jUE0Qod6ydfsdRg5sAShzGfrZDpcg6FtT+xcyyCTsUuAS+ObJU9x4
         HcqA==
X-Gm-Message-State: AOJu0YySH1FlG7ZPmdRmdhdc/qiKK2FRV697rM0Jtj3Ze/rXNCERFvLd
	jF8J2At9KKCD29x8S1KiePAApZgvO09WZUNq+HE=
X-Google-Smtp-Source: AGHT+IFZ5IvMYGEoG5wA5ML1toOnz+99UBbJfQ355ZBlwsVuO/M288NZFve5quihP9al8o8wuaVELi19PSmiEquHsoE=
X-Received: by 2002:a19:7716:0:b0:503:1875:5ae5 with SMTP id
 s22-20020a197716000000b0050318755ae5mr11001875lfc.38.1696347577773; Tue, 03
 Oct 2023 08:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230926150316.1129648-1-cleger@rivosinc.com> <CALs-Hss+OK-vJy_ZKjVbGh7rTBZA+GditWcdM1XjDDskGF76Dw@mail.gmail.com>
 <10997d30-e6b7-4a24-a43e-e22679e8d450@rivosinc.com> <CALs-HssAAgbdUuoCyPEdjs+8yH+a8Gzz7jCpMre-6k21aE_sdQ@mail.gmail.com>
 <CAHBxVyEOvJy8gBfqW9v96XwW6_XFoWb3RdrL=AqMHJLHS7n2ww@mail.gmail.com>
In-Reply-To: <CAHBxVyEOvJy8gBfqW9v96XwW6_XFoWb3RdrL=AqMHJLHS7n2ww@mail.gmail.com>
From: ron minnich <rminnich@gmail.com>
Date: Tue, 3 Oct 2023 09:39:26 -0600
Message-ID: <CAP6exYJOvjvuyBBk81+wndFqONKZXn6aCgVPeksGe5rQXZ0xNg@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add support to handle misaligned accesses in S-mode
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Evan Green <evan@rivosinc.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Jones <ajones@ventanamicro.com>, 
	=?UTF-8?B?QmrDtnJuIFRvcGVs?= <bjorn@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Daniel Maslowski <cyrevolt@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_083939_819239_FF60031B 
X-CRM114-Status: UNSURE (   6.18  )
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

T24gVHVlLCBPY3QgMywgMjAyMyBhdCAyOjQw4oCvQU0gQXRpc2ggS3VtYXIgUGF0cmEgPGF0aXNo
cEByaXZvc2luYy5jb20+IHdyb3RlOgoKPiBJTU8sIGl0IHNob3VsZCBiZSBzdGlja3kgdW50aWwg
YSByZXNldC4KCnRoYXQncyBhIHdvbmRlcmZ1bCBpZGVhOyBwZXJoYXBzIHRoaXMgZGlzY3Vzc2lv
biBuZWVkcyB0byBiZSBoZWxkCmVsc2V3aGVyZSwgZXNwLiBhcyBpdCByZWdhcmRzIHBvc3NpYmxl
IHZpb2xhdGlvbiBvZiB0aGUgc3BlYy4gVGhhbmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
