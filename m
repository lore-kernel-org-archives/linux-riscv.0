Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391AACCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 09:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NVPhv3EW9ExVw//IVLiHiYeWqvjwRn4C2LTBMbRNEm4=; b=ydt9HGYHSKgtAC
	kWICK/oiUsL9EUkuLGYWcQo5Mo9BFFCRvHRbluixmj0cy0u/oAuRBPoYkkwqMHpkjJoDSwkWzrM9j
	szMkxuw3cUJ+JusPBN2KiUlHcuiyRmDL7U1ES+U7KyaIf/DCQ51hMezR+p4baLWiTkvRZikiDIwtN
	fkUu/yUiIq1mpkyMAn27DrGZuL2yTkwqpMugdLYrY34Ko4adXEQyqmMNpJbCCzv1OU8WDIIwoM2lv
	yKqsJ8J/77pmtztgRqRg3w2oD3snetWhBmsSdyank/2ktsAWpfaQ+aa35OE7cvkEVK4YL95b1kzHf
	ltX0t0wfhsdXy3ikxgeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8lz-0000000GT1L-1j4v;
	Tue, 21 Oct 2025 09:35:19 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8lw-0000000GT0F-33dY
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 09:35:18 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-781010ff051so4000261b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 02:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761039316; x=1761644116; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xdLn1ynyVPZ4dxUpr8ekiQALFxRstWPAZs5IYw4es7s=;
        b=l9E/2dPp7B9RA6cAK6TzvCjsh8sFRtBoU2JmrJTX0OloiN1HsXDKA7RHF75glcvdhy
         tblXGgvGtV9nF1Q85vmGOGJzaq9oCdjbsv2yDCBqF91gVElKe9I111Y/d49ie8KKEx5q
         gJj0hW3v5PXcYV8127xKbzkoswbHPR5iq1nJn5YMRJC998ABE9j25jmXzSi4/yK7LfE1
         c6R7pvd1CZBmIhXF0R+57bKxnoXb5/129vfulQtjsWpw5XzCvtws58xqsbhRLxICmDSF
         yoWy88DrwkiVTzzMlZXx2F92N+QSExq24szbSp4ontCYvjUXbmUbLEct/K6ov1kiUDmd
         b6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761039316; x=1761644116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdLn1ynyVPZ4dxUpr8ekiQALFxRstWPAZs5IYw4es7s=;
        b=TjncXPt7p9KSbnQaZC//2x2Fr/jf3Qmos9925OBrB6ogIM/Nb6+lJHEyfghGy5IgHJ
         199K/iSbhWOxT976hHyIsiA/+TtZ3TFjzzXcWhwqltGO3cDorRFgHalXBnAocQVbx8mr
         YhQrhe7JlpkA9K85SK71Bxq+on90YpXvr/XCHZ43fnadNi5JPhj+SUpr2sFAaOCMSVhr
         WDYydNfhXv/D8+Mhs2RY8po/De8fFEn1EOZnQ9MkMxD+8Iipho1apgoYnisSjyPVnvSn
         K5joK9izW4NRPz0FVl1kGPS6gA7Vvx3YtDaUvQph28kB6G0qAE/f/W2mXIAUYSfRkeWW
         YJFw==
X-Forwarded-Encrypted: i=1; AJvYcCURvsZVAWo/sKeHUwFG0fu2p6OEYTcii5hkCWvauoGHcv8lvwG7L7XLEkrhrTFcEvgfuIwN3RZDZO6Egg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoxcfV3JfmYDeKt5653/SxIUqAMLV5L13KFVr+TFLpPsO7T1Qq
	EcvBFEN1gbOlVqm5ZnozkRPFJuzx4FSxiqL25A9WOQ0+ZmDJeJ1hXZ03
X-Gm-Gg: ASbGncuyZhIOwXE/cNEt40A/jIfgQ241TkUTSnejkyjw4Ou63XD8QRP5DOZ4X1wwUjH
	54C7Jix0skgBOYFK7C8aUjKcgDpEzGKpnjSmwOR2IziBCfhkBgMb9dbriCgDYdrrp8uyVF22akV
	qLEk25AeGkxRU0FYOWqIQeK6eb/vrgpO7+Ixo9JdArnFoC8XjjNoBR91Myx9MIAjdV03LMjl861
	aU8Y9yY74H6LQqqPScT5L/tcU+ga5Ylww4b0K0c34HUhNAC0bHeDH+9hf0nRmxsK3dqfQ3r9unv
	hvnuD7BZBNJPGJ2zLo/DMPa52NC3EDysv9tRDB/89Ix4u7/eFW6jtCBzy58dTY6a7GqhBOfKAD1
	Y11nEpyq1tUNHUaLzgKUEHnFrIwhyeqgy+nkG3u6Qfm60dQdiM6t/+iSt+KEjRMiJMrLPO0pIpu
	LcknZEkZb0JHY=
X-Google-Smtp-Source: AGHT+IGFkWwUhKlvX3wjqRF8Ewtzj69yE0Ksx7a5SqOmni4nW94Y4t7Udab8ZYZ89rvlIzREH0Iieg==
X-Received: by 2002:a05:6a21:328a:b0:334:a1bb:5898 with SMTP id adf61e73a8af0-334a8621674mr21770370637.40.1761039315601;
        Tue, 21 Oct 2025 02:35:15 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a764508b0sm9918642a12.0.2025.10.21.02.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 02:35:14 -0700 (PDT)
Date: Tue, 21 Oct 2025 17:35:12 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Ze Huang <huangze@whut.edu.cn>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/3] riscv: sophgo: add top syscon device for cv18xx
Message-ID: <c2b4zfjfqqorku2oznpwhvk4mwfwv4sypv5qxi2pk4xsxknhnz@o6euptpneeqk>
References: <20251020083838.67522-1-looong.bin@gmail.com>
 <62bb4f8d-ffbb-4529-ab0a-70fd8c77078d@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62bb4f8d-ffbb-4529-ab0a-70fd8c77078d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_023516_767397_FDC7A477 
X-CRM114-Status: GOOD (  13.95  )
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

On Mon, Oct 20, 2025 at 12:04:06PM +0200, Krzysztof Kozlowski wrote:
> On 20/10/2025 10:38, Longbin Li wrote:
> > Add top syscon device bindings related DTS change for CV1800.
> > 
> > ---
> > 
> > Changes in v2:
> > 
> >   - Add ranges property.
> >   - Use proper regex in patternProperties.
> >   - Add complete example including child nodes.
> > 
> > Changes in v1:
> > 
> >   - https://lore.kernel.org/all/20251012022555.6240-1-looong.bin@gmail.com/
> > 
> > Changed by RFC:
> > 
> >   - https://lore.kernel.org/all/20250611082452.1218817-1-inochiama@gmail.com/
> 
> 
> So this is v3, not v2. We do not count from 0, -1 or -2 (of you have
> three RFCs). Please start using b4, so you will get it right. Otherwise
> how can we compare versions between v1 and RFC? Try yourself with `b4 diff`.
> 
> Best regards,
> Krzysztof

Sorry about that, I will fix it next commit. Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
