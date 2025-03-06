Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75BEC282D1
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 08:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FSQ9Ih5gvyM3ZqWy2GZuAjL70IM3Jk2ToJGwI+breMA=; b=LUpErsyTUbdpIB
	zTe7uRUEUcUIUvzEkgwftbxqxRzAJEpXejdwTDeHPHsYsPVfaJ8ij4LgFumIitiPEQI2uudznLrC7
	d/oH/35viTYF8EYIdrjN9h+mLFDto9kxuZHX7+PtVmKSKcfsJoA1izWtHfOwxTp4aEutPyUkxQVgX
	JktfH137zmlp1iHng3dqThG6+My+d+xcXMFzmV6H4yFuDApv3mocwi/UGuRsBTlHJw01eCpICuC6e
	qQ0kansQpUxal22mlu4FS9QmgamiYnBwLykWJwUDnqnkQmXb27Hx32jQu68uR73B1XR6GgLIs7QGP
	edtMzVVDQzU+z3pdfVVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6xS-0000000AOcX-2MUH;
	Thu, 06 Mar 2025 08:51:58 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6vF-0000000AO81-0Qng
	for linux-riscv@lists.infradead.org;
	Thu, 06 Mar 2025 08:49:42 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2234e5347e2so5671145ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Mar 2025 00:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741250980; x=1741855780; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XOTsx+ET2udwRwOl4LMvTIaV72hOacAVf21e+cPMpSk=;
        b=BjEUOmCRkn+/nCqbwAs5X6MXD4ARzy7x9pM4wiySLcKk05kRv1W9qx5LxUqOMLj5RV
         TNld8QTHm3cODDYc955wqlxw5oWtdDh7GhTD6goGl9rVVyz0wBA8TrVBIzIVTtZcMi+I
         xIjGFrd5XYUlmO6qXTZCyJGDpH2lGjGy+kpJj7olttZJmOtztRCp6PlsY2+QYYlDS8MY
         WtftKCMoRZqegjKWHs8kQCXZD4yMOSLjfohohwOWEFRGMI+O+IBscqxNyWt32dzA1vj+
         FGvyZjf1W+XOJP5wMcfVp7dKwvc3mKUw9cPmnczt919eZ2iOk7UWCzaMlFfWnsjlzUjL
         6ABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741250980; x=1741855780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOTsx+ET2udwRwOl4LMvTIaV72hOacAVf21e+cPMpSk=;
        b=lmylgQdjIdbLtLkqNl27TK4xNbdckJ12FWAVIyz7D2JNGGdD1XfgqfbYEZnbl4TRpe
         Bz+6w/tBpbiGkM9Hqe8qsGaGWhBExiMaN3cF5j0OKHiPm/Uud/Ce8x1H9z112NIoTGW6
         OzqfNEDwNlgrnvgSr80SelR040ujBbJzG5wk4ybpSXQIhi6n0D7Ia6Af66ESNVEH5dev
         z1eibZ7aHVk052zFyfU0iZVRD7jkaVYy9PvPJmm2IHgPp1r8YGIhuxVDYEyMb6FbL6BL
         wslg7XpX7vy5/owo1k9pP0JZRATWNeLbSUP3asBtf0WDDWiE3lr4KvN3C33DhoKPhREy
         5WPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzGNrqCbhhNmjWz41ZgTMxwjhwsRgH0YgwNvEzePtI2rJvSm7EEIXyCgzkqcoG+1UOH12jShEiUZqA2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDOGRsi2eMy7pqJsiQP6CL/QhrwpKp8DRwRzJXE5zHH7G4+8Tf
	TA6Vdfe2YWchzvb4yfhq+zxqg5XBRXDhXVxRqQFgbrcJPcZHO0550YmK5v2u+z8=
X-Gm-Gg: ASbGncuW21ygPyVTot86pnXMZItJ9msv99har60DZ+RD4PdOnshH9PWGE4xcH2cDrYJ
	581WpMfyYLKfQFeBqu2+FNc5cULg2y+RcfuN0ASVByw8VpXLZ3zabI4b8rW86MNrnTx7M427dCn
	RbcaovciTxW6ZbiOodW5lGo8LXgPqhuFycAqkfU1b8FFXCB+pwbwUO/+/DsjY8DRkUBX3+5kYjI
	afjZjDUsjriQbPeQCn3AeHAFBdaV3g83EfOpTnX6CYkRUJgYsoiGOKuBR/YQSZyYIIfTT1fMGqJ
	Z7qc5Kx+KVre0d8MVAjAFfu6qIWlhV5+NYUMVhUf
X-Google-Smtp-Source: AGHT+IH1GEQtPc3doXxTnYpQvOe64EMdhiCow6f81zGlmJXK3+o6BGbwtqTdcVYdbtsYbbFP1fY7vQ==
X-Received: by 2002:a05:6a00:148a:b0:736:3fa8:cf7b with SMTP id d2e1a72fcca58-73682beac25mr8907211b3a.13.1741250980111;
        Thu, 06 Mar 2025 00:49:40 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:2536:10cf:d064:60bb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736982077dfsm799045b3a.35.2025.03.06.00.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 00:49:39 -0800 (PST)
Date: Thu, 6 Mar 2025 00:49:37 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ignacio Encinas Rubio <ignacio@iencinas.com>
Cc: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: riscv: fix v_exec_initval_nolibc.c
Message-ID: <Z8lhoTd3BwPWQ0f_@ghost>
References: <20250305-fix-v_exec_initval_nolibc-v1-1-b87b60e43002@iencinas.com>
 <Z8jG1ViOUbw79cEN@ghost>
 <f3bde84d-b53e-4b81-b995-3b81d614b789@iencinas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f3bde84d-b53e-4b81-b995-3b81d614b789@iencinas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_004941_371836_84652D10 
X-CRM114-Status: GOOD (  21.06  )
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

On Thu, Mar 06, 2025 at 07:31:22AM +0100, Ignacio Encinas Rubio wrote:
> 
> 
> On 5/3/25 22:49, Charlie Jenkins wrote:
> > On Wed, Mar 05, 2025 at 05:39:28PM +0100, Ignacio Encinas wrote:
> >> Vector registers are zero initialized by the kernel. Stop accepting
> >> "all ones" as a clean value.
> >>
> >> Note that this was not working as expected given that
> >> 	value == 0xff
> >> can be assumed to be always false by the compiler as value's range is
> >> [-128, 127]. Both GCC (-Wtype-limits) and clang
> >> (-Wtautological-constant-out-of-range-compare) warn about this.
> > 
> > This check was included because the "dirty" value is an implementation
> > detail that I believe is not strongly defined in the ABI. Since linux
> > does always set this value to zero (currently) we can safely remove this
> > check. 
> 
> Thanks for the review. Just after sending the patch I noticed it should
> also remove some code that becomes useless after this change: 
> _prev_value_ and _first_ variables were only needed because two "clean" 
> values were supported.
> 
> I'll send a v2 tomorrow. I'm guessing keeping your "Reviewed-by" and
> "Tested-by" is the appropriate thing to do as the changes are very
> simple. Let me know if that's not the case.
> 
> Thanks again!

Yes, those changes seem small so you can keep the tags :)

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
