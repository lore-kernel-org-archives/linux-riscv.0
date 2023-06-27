Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5933DEB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 23:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fiG6liAFjqDVA+SdCU5e3dHAH8EM/FhTy/0b3du8ul8=; b=n2jTKO7CdV0U/g
	lP/QNcvy5fN7wumnEj7iOl4GdovjN2F7Ei98QRfvnPrCPqh9ApnkEAQXurGp/rlWX0N/uI2FGHY0s
	+YvolxMfDQDNsl0K/kINSO2slmZtJZCvE428AEQXk2clWgKIXOFXkszFDGK3AmHy8xS+Q7vflQ8XJ
	Xopnc+DGobwNvshJ7ZBTog1x3D4civ0Vi3agSdsU0DrnB375UafcmPfA4HQHe3NjKfKihMixRdxQA
	BYeKYE1QFXSY+uzliQY0TTxU3gmgMmEoS67OM6+sWm2y7yMDZcVa/gIgTArMDzmq+UxD19nCgXuF9
	vLaZ1W3ggKWKRgmd9PYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEIH7-00EOAY-0I;
	Tue, 27 Jun 2023 23:39:09 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEIH4-00EO9y-3D
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 23:39:08 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-67ef5af0ce8so850912b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 16:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687909145; x=1690501145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UEotHXGDYPp+N3kzq40A+VGZCyOFKrHwBcgbYar1LOg=;
        b=eYlkZ7RRnjfcOrSEl/RtfXtVIUDXY/SobZ+VOu+z+XZHDsoEHatYx90/aUQor4mUER
         wxITd49Kw7XvhgcVFYoq4mFZHL7z9aHi0r+QhYL+g6lSIMWRwtUnRedNFC3xOasfMCGu
         NMW3alJ7N94ag1BxPWU3TUclX+f/qX/0DGmvK8TotY9FNIbXV2sghgXhF1dj95yOf38/
         aHhPazCeoEJ3bjLeb0sOynGrNXxx3SbNj3Yv4MZJkno3PbCEZ90u3WQM2pmyz5GbAghI
         VTNT8URWzEYzrjzYGj1gAMAkiBLPMrE0uL/vLOppa8GJnYQW2b0d5av0daalTnL+EJTh
         10/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687909145; x=1690501145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEotHXGDYPp+N3kzq40A+VGZCyOFKrHwBcgbYar1LOg=;
        b=ViKB0eCXUP5vvgk3Vxuv8iJclk77AYs6jVyaum51zPgdYGJqs8cYqXZUcMoZyYX0Q2
         hot4MTIO4aZuyTjf435OqFK/zvkqVkUmT+0x8uP3bsWJ42E73aTfj4zoKwIlM5tnQsvB
         LnMOYBhPcH3ruOW066vG694/a888cQyd6SsTok2SEujAvyrP+PdKgPEjmScrxu39jdFQ
         wJvLNG2qCKja/3wreHMpXEqbMoULCPv2mKusksksFJ8d0C2wHp3VM6Ke7LPm89y1vaPZ
         XajDM+Z1IT8/NYBKBDYu+laRHlr0z7MvrF002ZDNlPMrvb9JLn9vdLBA5ccnO9kSU+ZO
         c6Ig==
X-Gm-Message-State: AC+VfDwvwouuIxxElxocQ7vLWb5CJhspGMYy2aI9X+k547RMWhKA+KJv
	gWejjLzEoUZYHJ+2eB7v7kIyfw==
X-Google-Smtp-Source: ACHHUZ5OkeSCUeB3U9dhKZWjZbN1Lvc3xdWPDUeDJ0nMM+W1gpyxhwafH7+mT55TVE586Y44vKy4GQ==
X-Received: by 2002:a05:6a20:244b:b0:12b:6898:2986 with SMTP id t11-20020a056a20244b00b0012b68982986mr3198761pzc.1.1687909145650;
        Tue, 27 Jun 2023 16:39:05 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id fe8-20020a056a002f0800b00666912d8a52sm4748899pfb.197.2023.06.27.16.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 16:39:05 -0700 (PDT)
Date: Tue, 27 Jun 2023 16:38:58 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>, bjorn@rivosinc.com,
	Anup Patel <anup@brainfault.org>, Evan Green <evan@rivosinc.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/2] RISC-V: mm: Restrict address space for sv39,sv48,sv57
Message-ID: <ZJtzEn9Yut3nPuw8@ghost>
References: <20230627222152.177716-1-charlie@rivosinc.com>
 <20230627222152.177716-2-charlie@rivosinc.com>
 <473F7474-D7AA-4C9F-95A3-320F1741EC50@jrtc27.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <473F7474-D7AA-4C9F-95A3-320F1741EC50@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_163907_032050_081B1640 
X-CRM114-Status: UNSURE (   6.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Yes it is small to have a default of 38-bits of userspace. I would be
interesting in the opinions of other people on whether it would be
acceptable to have the default be sv48 and require applications that
prefer fewer bits to specify so with the given mmap hinting.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
