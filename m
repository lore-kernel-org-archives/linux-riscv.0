Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D980C0755A
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 10:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KNiZ/X7iax3ZhZuJis4PK9kzGiBL+qkTi/nihV8g04Q=; b=AS7wY3gI7ia4vQ
	tC1S0FU2zsEw8CPy8WwozQ54t9DZtT+l+TmVRhuomqtC4CocXbrdqiDHE4d0HPkj6fKjDdSCsT/RJ
	afY36EGfCas0SQsS+WD9nOqiSUTJ5QEus92E05ezGVicWtESNH0XVIg0TMV7u3mjR+7Yx/liQfAgM
	kUmFSL1G5ygDkbZldNZ4+84rKDqWBnhkysQme6zAUYNoNWPY/UL9o+hVC/xZiYAYExdmhPcAdc0yR
	cPY7kLmIWlHhCVO0W6fbldDCwQ2F0SwvWv2BU/O/uBANuv1iCJvFISRSm6WGudD2111ljJfngxGBa
	VwOCCTh9meijR3dUPAhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Z6D-00289A-0P;
	Mon, 27 Nov 2023 10:44:21 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Z69-00287A-0J
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 10:44:18 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a00f67f120aso548266466b.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 02:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701081854; x=1701686654; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=maLf/n0rO7h34/VWW+Uh1BDkewzdC3UBO2BBtmtClZI=;
        b=GO17TycYm0xHnfkUGvz9Zn9wTz383vd++76qcdfrHvivapeR+kGIEexoz2L1Du6GQb
         4gWU0Y0m4b18XCgeIC+9O8sDbIRg3SkVso+HeIMrRmzWTHlaxFCh6KX0qeHRdKoZ/fuG
         oFsaqesCbWXQnnjSZulAydBtrQYPeqgtKsmQnvQx/RZJZQOAMmtCIZTR6EpdupDm0yzD
         U3ga5gFICvekr61S/abVLu2LuhfQHW482i4liY5wda1rBoHC93P94riPf8yV6b9Vs/87
         6QEVVHMpietmz70y2ZJ+G4o/lzv+LuaTtSMDg0IpkJsamt6wt1KxV6XJpw89CE0CcF9F
         karA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701081854; x=1701686654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maLf/n0rO7h34/VWW+Uh1BDkewzdC3UBO2BBtmtClZI=;
        b=LGS6IRCCVhegw719BcbZhdTLpdWlSCT2f7su5yQgri/Ztv4j0AHT2d1bPR2hc7s93d
         Bsis/Op417vnt8NVOJwADGOIdF5pg2N3rAUUg/2FY/mfQmH5674Lkdb4oNJAwCvSY3rT
         fEpnU9q2SHFUvu6siuD2/lgZ1sczr8lza7fZBPz5Wozd7+jMeho3FM0FXf9QSdz4ZOR9
         /YFW4Sjukh16ybQlALD4rnCNAYPTJuH1ZVwde8V1kcK6KM+JzFkGt9GvMlloC6JPFfk5
         LGTFsE01MeOAjNiydDbHdJ02+T2Cy8YWZuaIpiD/ux7H+lwYgCerywuDJdhPt2vvXbZa
         5EoA==
X-Gm-Message-State: AOJu0Yx0I2g1jUiq1qJiULnjAZXSp8SgJj7v3iX0PsueAU+8OYUdKJyw
	sk/Pet1qih8r1u6ia1r15ds=
X-Google-Smtp-Source: AGHT+IEdM+j0ztp6LCnNavmN9Ryh5bNIc0a0EN/Uu7itFKT3TCiooW66kHo1LBhqCdiFDC+eG4WAGA==
X-Received: by 2002:a17:906:74cd:b0:a10:dc00:c6d7 with SMTP id z13-20020a17090674cd00b00a10dc00c6d7mr924975ejl.0.1701081853656;
        Mon, 27 Nov 2023 02:44:13 -0800 (PST)
Received: from andrea ([31.189.63.178])
        by smtp.gmail.com with ESMTPSA id n20-20020a170906119400b009fbdacf9363sm5509749eja.21.2023.11.27.02.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:44:13 -0800 (PST)
Date: Mon, 27 Nov 2023 11:44:07 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, rehn@rivosinc.com,
	paulmck@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, mmaas@google.com, hboehm@google.com,
	striker@us.ibm.com
Subject: Re: [RFC PATCH] membarrier: riscv: Provide core serializing command
Message-ID: <ZWRy9/MD4nTAqEW5@andrea>
References: <mhng-b720eb90-633f-498b-a487-0cfdc9f00ddd@palmer-ri-x1c9>
 <65e98129-0617-49ca-9802-8e3a46d58d29@efficios.com>
 <ZU0sliwUQJyNAH1y@andrea>
 <ZV6lxsRmuN7bYFnD@ghost>
 <790b8b57-43ac-447a-96b9-150e5b3a4237@efficios.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <790b8b57-43ac-447a-96b9-150e5b3a4237@efficios.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_024417_156101_1EA59462 
X-CRM114-Status: UNSURE (   9.80  )
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

> > This looks good to me, can you send out a non-RFC? I just sent out
> > patches to support userspace fence.i:
> > https://lore.kernel.org/linux-riscv/20231122-fencei-v1-0-bec0811cb212@rivosinc.com/T/#t.
> >
> > - Charlie
> >
> 
> Hi Andrea,
> 
> Yes, please send those as non-RFC patches. They align well with my
> intentions.
> 
> Thanks!

I've just sent them (after some editing to address the 0day report):

  https://lore.kernel.org/lkml/20231127103235.28442-1-parri.andrea@gmail.com/

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
