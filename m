Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1180C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 12:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kxijuy0V57LYtpO+6EKY/hQuzV5rvHvwv5MVl+7euc=; b=0Mcn0jvRwlw59V
	LO+Qqbf18O5WDOb5upZVqiX+ITs4kADyuh1Ez4zPlhKZ8ebaMUM9MrONu5fBy5gpz88AqCR0JagqM
	YbPRmmAwKkpSdls5BvuEzBKE4oc+BL/oVS3QGa2pYfKUOrRfbiRS5Gew/3Mzb8SVvoDpTXyIZ/J3f
	ruPW64wLKS8aA7CZcXKomgXIuvhXWoMpb48aciSHw2XiNPEiS8K3Ta8s447gKLo24P6mfT9MhL2wK
	4j70SlMJZ5kc805DJUZFKexcJgZrhs1o0RufYMJIWf8ze/1NuMTO2YzAn93JNc/+NSMpYcWArmTe2
	eRZ0KE9JyTGqSWia8PNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ8JQ-000000012CN-20lN;
	Wed, 31 Jul 2024 12:20:12 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ8JN-000000012AZ-0XaR
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 12:20:11 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-52efba36802so9646639e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 05:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722428407; x=1723033207; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nOIxnk7407zYgmcLnWaUjuP+BwjeEvDM3LSUzPdgUOk=;
        b=GIfCgruV2JDwubXwT9GCyB1rYJ5mzpKeYMuugE3y9lA6ipB2fn4G79iIqR0alw0dEu
         4by1tGLTfHOoWSjkrPfmN4L+46Ii8fWdjotxSAyqk6m0fdoCqarCZQqHr/E0BvbdcrC7
         m1mcK6nwpIuaInuabVAlq/k6IMLYXvHsrlK0jUKtAWGbTyzTBvqrSN6FFJcW0Y1NDEhy
         3rn/bG/wnndxUuZxNNkTMUENPZ31FkvtQ2m0ECCZfcKCjmKVkeHuhmAsawTbkAF7qqvp
         4rjM8G7VugVBSTippTnzt97hjCZAsAlFaaw+xmGoxGqjEP/zXvgqm4kdJFfsPbE3if5S
         ujgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722428407; x=1723033207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOIxnk7407zYgmcLnWaUjuP+BwjeEvDM3LSUzPdgUOk=;
        b=JItWqTKBvW3Wun94eTOsqGjhHnBXQhKhvs9jRv1Na6RHcxB/rE8GHeLYtzz/C8RN9e
         u5AJXmfIokoZq8AJ4Q7Wtgpo7J+oKNUKITuhdtT1chkGe5c+qf7ojnk7qEemdaZh8X6j
         TyTwNGuAw4l6FQEhjQU68ROSOX4RTY4shx5qTgak3jSOS3+/0LEDcIelr/0Gspr9i4qh
         buFOD88Lnoe8rXuMbYZPUI8vNCLEoPMZpJPFgFyZoUeuRmqHBzx95A9KtUHhKA3KODQv
         axIM2hftk9zi1WwjEhINDBgZAFHJOThtH+1NHQOGDzn5OAXBFs4Xc3X1Mlv/5LCxfjWg
         ZR4w==
X-Forwarded-Encrypted: i=1; AJvYcCUeftg80Vw9paoZP3PxMN94ygifIWMlGOotS+HozC+Y/Qvmy1ip1bWOJNWrBcW1FYosOX22mVsTx/0/kXHDJ3TI7LLJtn1Y0q26nXuQsdRa
X-Gm-Message-State: AOJu0Yx7DbsU0NCarKkbpHBhqkGiNZnVYbRFOxtiVIET8cJWj1aP9eT9
	PfDMu87PaPcPuru1dVBIcfVtkh9k5kAimVWwLl5mRIBgr6JuXU8ww7F+gWCFOgw=
X-Google-Smtp-Source: AGHT+IHyNIB5ow4TlUDHNH1tkbFmcks/+EVzVky0lfsDx0PedtHsujag8S9TeJckFJO9ghO9Oafw5A==
X-Received: by 2002:ac2:5b89:0:b0:52c:db0a:a550 with SMTP id 2adb3069b0e04-5309b2bcbe0mr9592703e87.42.1722428406890;
        Wed, 31 Jul 2024 05:20:06 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac631b04e1sm8624673a12.12.2024.07.31.05.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 05:20:06 -0700 (PDT)
Date: Wed, 31 Jul 2024 14:20:05 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v4 08/13] riscv: Implement xchg8/16() using Zabha
Message-ID: <20240731-60c5ad3ae9ec128886aed802@orel>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-9-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240731072405.197046-9-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_052009_191576_1B9EFAC3 
X-CRM114-Status: GOOD (  10.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 31, 2024 at 09:24:00AM GMT, Alexandre Ghiti wrote:
> This adds runtime support for Zabha in xchg8/16() operations.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/cmpxchg.h | 65 ++++++++++++++++++++------------
>  1 file changed, 41 insertions(+), 24 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
