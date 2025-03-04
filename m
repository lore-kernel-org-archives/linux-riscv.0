Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3406C021B8
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 09:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NzrcHQ/x9SFt4ERAqzoYK5qw9o3a4dZ0qQQbSquUOoQ=; b=Gxlb98v31EtudT
	EitNCMQ7hOBmVQJrXBFzIPV2btFzJlTy+06FpFug2TTLXfkYfx24zNgKN8pDbrueDSsKlfDcqq6q8
	X2+ce4KHDd7BWKeBHQKlH26ShWPKwNfPCK1lTSb3Y7NdIuZjdvlOkOfH4mOKi3tEJ9/kc+t/Ahikd
	Hu9nBoc6naSN0e0+p/cjm/KtEA6GXjvMr3u8HabIXfx8hvsHEKW4zDHkA8+jO8qZIXXDC0/9gBZOq
	Y4b+cYAsn7z3q+bhFEZ6VL2zl3qH4qOaz2nkEMnK/30R3tFO+GuW7eUml81MqqBw78tzqdqxBuV9M
	S/W0vEWkXARRILNcSgdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpO8r-00000003kMT-3oZF;
	Tue, 04 Mar 2025 09:00:45 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpO8q-00000003kL5-0OqK
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 09:00:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43bc38bb6baso11002325e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Mar 2025 01:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741078842; x=1741683642; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5UP7DmGMGEllBfFdaot9026+FUs+6/ByI4Mfm7p9ZUY=;
        b=RVypVYBOVX3zpSzoUsQrPqbq4sJXta2AGOYdjZQCbBPmUcG254wkC+Y6Kt3QlwYQ8j
         Kc61GBCSbIqeOlb1aFBJbXSjHDju7vS0s224CEtNn3R/wSAJIEi1VsF5bFPp7BWaQZ3g
         MSTH+NhyVN0JZ7TtlBnbtsTjS/sp037NUYaQ8opJnYuTQ/kTQ9D/3BAkJqqTArmPlow7
         GDQrB7zFin7v1R4NRJB8kgO7UWUAo91sLHXhYGv1kpOspXdB0ofBGi8ePpv9c/bN1GYr
         qPfA9MnCegYD25UrzXBIKT92behBJD0lG7UPYUmAL9fEEZogaagXu8VHcuvZVXar9YVR
         OaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741078842; x=1741683642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UP7DmGMGEllBfFdaot9026+FUs+6/ByI4Mfm7p9ZUY=;
        b=RQs6NTXp/wUGg9coUdvFXgOgceK62RtJ+6LUS7EAGxZEqc6MngVWRXsRtq/CfDgecq
         x3w3bOOqRZlZKOXxHj/IcVIi/brY8qq4nzBtALOaFnsz5WxoWAOxg9Sr2/dPgEDFcL30
         GPMhM6kKrTcsu94x86RKG28An6uZlsXRIQbr/3DRo+slTB0/EUtzaFEBlcyohXgjAOpM
         OhgK+//JajJKDGyFxfYd1m53W+YB7R7miHfNCqqqsvY1UjG0b0Ywli3N/sY6z4bP4Cl1
         aqdHx7iwjCj3GksLVBWMX0PUOvwoeu+i8SMuaUATozTBTjffcDRCCW7sfsOJsF7sdDvu
         C7wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvhJwKlm5w8o2vGzdxz2nyXy7e/J68hdX3DzdmMm5A/Ca9/8ZsGj0sof8aRhEHAdG/E9sTZBrk/YNzJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4Uq8dzqizmVTHkNZioAfyF57gs44hYDE8ayXlq0D2qcHjTnNj
	h8/Thsnz6NGVD0um4X4Tu3NIiC+MQjXjrTV2sMjyapLvZnWY0g3qIIZsR8dsbJ4=
X-Gm-Gg: ASbGncsI9eTHER57vpZQpLi4umncqzb/BsL7qRyG2faxnXiNCkxRgakklGrjKWvTmJO
	NN5TIu/qznhvU01Gk2O3qud9na56NnNQ1RiZ5HUqnLAFOfBtCg+6IjXrQAq865aAD8J3uWgnXx6
	BawI+OwROwgcRWx3k7aj/tluyHmFgme8py+vVbrRs4OQOgXVQISG/BLi1Nb7OWMp1M8r6wtDCvX
	80QUIbeoLLzSoY7EBw8pd+Q5+K/H/jFgCoWNwF4giZKJjA87RSYbmWwDioeWPNomYC/OeNtJayW
	Of2SaxuzWeEjytmdW4f9ZchTEWsSOlcw
X-Google-Smtp-Source: AGHT+IE98Wtw/qck2RNdbUy35iBZdcuCmo9BHlXLPhcqJEgVkq5LxR8GTapjzExbGuStv6PALsyUfQ==
X-Received: by 2002:a05:600c:3b23:b0:439:98b0:f8ce with SMTP id 5b1f17b1804b1-43ba66e60f5mr143195855e9.7.1741078842210;
        Tue, 04 Mar 2025 01:00:42 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bbf2edf84sm75715855e9.40.2025.03.04.01.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 01:00:41 -0800 (PST)
Date: Tue, 4 Mar 2025 10:00:41 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 4/4] KVM: riscv: selftests: Allow number of interrupts
 to be configurable
Message-ID: <20250304-bb96798e9a1fd292430df3e8@orel>
References: <20250303-kvm_pmu_improve-v2-0-41d177e45929@rivosinc.com>
 <20250303-kvm_pmu_improve-v2-4-41d177e45929@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250303-kvm_pmu_improve-v2-4-41d177e45929@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_010044_126553_B9208249 
X-CRM114-Status: GOOD (  11.78  )
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

On Mon, Mar 03, 2025 at 02:53:09PM -0800, Atish Patra wrote:
> It is helpful to vary the number of the LCOFI interrupts generated
> by the overflow test. Allow additional argument for overflow test
> to accommodate that. It can be easily cross-validated with
> /proc/interrupts output in the host.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 38 +++++++++++++++++++-----
>  1 file changed, 31 insertions(+), 7 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
