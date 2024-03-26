Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB89C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 18:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZKjUIunU5xZTyfFQVUW0/0fKckazvaqy63xVzlwXvg=; b=aYeFBvKl82h54H
	CX+dxU2g/dCgAJ1+x0QQ0i/vXmgTyBUaXrgLavv8BRTLIvLmc5x3NbBD1naItoo9b4A+o4HMmGQcB
	6JvGrZmRQh33vBmJQzGnIEpZNM9sz2QSd2wmuHDU4olTLFH645MyQ95OkI4F8yJeemxe+0S+qHcut
	NcvDqgCFBRkq2nCiKBW0dM2pKo7T6oU45CKNoV7lIxOE7cNf3XZUuHX9F1YJNRqL45F3L7SFRu6MF
	u6IB9k+xgZcWGuwqt1xIyq0ISq6RG4sG0wfyNwDfCULTerwgbdyfq9uUGxplCZ3lscPm1csHhohGb
	snDWaWyffp/ecvrWrdqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpBxi-000000061Gj-0H3r;
	Tue, 26 Mar 2024 18:55:54 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpBxe-0000000619H-1MIV
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 18:55:52 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-476bb6b964bso2175702137.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 11:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711479339; x=1712084139; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXTwQCFaZAj0sjd3yq+jvLdZ002w8j6x4hmq5jp5QuU=;
        b=VzfSUXvA4E4TP+/ludRwfDzHCzpc5DAsA6fNby90LoapZyhQqXAOEeaG1eI4pPbmfu
         X3YhqA/CpuTFQ7LIa4abgrs1uacRynF9B7ws7jJmlVm3+pAc9WKW9zAH5GucZg/C9IRg
         ePZg5R+WPl/64XKPgSJD6AxZw9d/XqLSg3gKMOPftOh5ShW8+tmTIFyVvxYuo2Ihpwxx
         SBzXmJ1YOx7lbMqi3O+br4ui8HcwUDDQzH9AVpgdg5/r3hB4VQ93Ym8OoPSATYKi9TiB
         UsrTw1TJ0DULJEgHtpbrDFgD2usE6rDbbOjpAncIw8Nj/2B2Rbd/h/AD5pQ0/+ASo+Tw
         fc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711479339; x=1712084139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXTwQCFaZAj0sjd3yq+jvLdZ002w8j6x4hmq5jp5QuU=;
        b=BF3THeqJbbf/9WbNDDzTjow7ImHp6dOsusXzwO0jPI2htvMTrkFelGATI/JbLfcHJg
         qqRvLgrkEvIPCJJi5sKEoEJYsx7RI7qdK8eVtCILK3Wi9RnsnwGjh7iC27vkMb1wniP4
         z9tTlosAQ11LeFK8POjF+MIjYi2QOcMDxCwf76rP3iSEePfLQyPz4Lihkt4ROL1ErQvl
         FS+dCazRKtZGprzaPoipI/vJ5ioJmn4Boo6yS2TP0bdsjLX1Njp/zMbfjL2ht49cXI7s
         CHrGjxjqnoLvHubHS2BMdkwK69Y+2PFUnCOgu1Ho9gRgoSLlPOdacuooQnA1vGsUus/c
         trFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnEPqhcit43E2/j+xMJnX/KiP7SZAkiPIA/orY6J4SeLcNN7tRjnrgQoBIHfk4geImTuT4o0D7yRmUqpNg+rxnOM4t9D2/5dJWuBTahday
X-Gm-Message-State: AOJu0YxwKpnfvkMzb7qY5dRy0cPTF/CNZPd+hy2XQUThE6VmadNUXnGy
	DzcPpnQ7Z58sVUi2K4qGXpvQplBNAppdHvg6Nk1mA6zOQFWnLKJUhKMrgNT4DVuAz2TUOIXv7+W
	MO4sHjOZS9ugWzsXhx5Hg8b49//QPjTztRi0U
X-Google-Smtp-Source: AGHT+IE8JrH0I8/953zvrzCMR+hs4V4VMkFMJbs6d/MRRtDQ+IzoyJJNkxrTzBfqLyeMkE0r30YIW3GMqVQZIGPYLOM=
X-Received: by 2002:a05:6102:3969:b0:474:50f5:723f with SMTP id
 ho9-20020a056102396900b0047450f5723fmr680505vsb.18.1711479338882; Tue, 26 Mar
 2024 11:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240326153712.1839482-2-samitolvanen@google.com> <a083fe56-19ba-4c12-8364-944d8bbcc043@ghiti.fr>
In-Reply-To: <a083fe56-19ba-4c12-8364-944d8bbcc043@ghiti.fr>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 26 Mar 2024 18:55:01 +0000
Message-ID: <CABCJKudxjhbLo_2zHBcsPh42vuLUGFj9wUxk+jf5USf2mvUZGg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Mark __se_sys_* functions __used
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	Linux Kernel Functional Testing <lkft@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_115550_498518_78227F70 
X-CRM114-Status: UNSURE (   5.92  )
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

T24gVHVlLCBNYXIgMjYsIDIwMjQgYXQgNjo0M+KAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBn
aGl0aS5mcj4gd3JvdGU6Cj4KPiBEbyB5b3UgaGF2ZSB0aGUgbGluayBvZiB0aGUgcmVwb3J0PyBT
byB3ZSBjYW4gYWRkIGEgQ2xvc2VzIHRhZy4KClN1cmUsIHRoaXMgd2FzIHJlcG9ydGVkIGhlcmU6
CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzU2ZDMyODVhLWVkMjItNDRiZC04YzIyLWNl
NTFhZDE1OWE4MUBsaW5hcm8ub3JnLwoKU2FtaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
