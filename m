Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A7BCCD1BF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 01:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ar//LQhp1n2w2MRiqG856Jy8dXg/ilHkpixT7aL5+1s=; b=0+CEEL3PQcuGn1
	I5K0r4v0zbtZCMJ6AoU4WwoVppbqmAigNUkQTdVEKlfAKap0aLAP2WBRdfzHezSO8+hCKbLEcdkVn
	RXsGrZYDiKUL87zcDvasRdRzhwHZpoF7g4Yoyos/A+wUxhvohxNmY1oSNY/PipHgb/M7w1+iBB+xI
	xCllenX4mypZElCSN+/SGmh0euYNIlimqKZiCg7YAh6eLFrosi2UFgDJYpT821K66cFI/HUYzuayv
	/i/cpwKNgF8alPyjDghD7iEXG92ncZbii3khJE0w9wstkFbBqJWPDczAAwDiDCYC7STlXkBJRuiXz
	nM280N17Br8h7rB3sqYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDuYh-0000000GtRx-1qE7;
	Wed, 29 Oct 2025 01:01:03 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDuYf-0000000GtRR-38zC
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 01:01:03 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7a26ea3bf76so8742239b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 18:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761699661; x=1762304461; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EOFIBRmcwlFaN9bXxhzQe/4jdraVkcYuslQKkiUSHs4=;
        b=f0IS+flhDIswc5E3ujIFyWWWbVfi/uOJcvV73IhQt6atUYBopKRFG2Ol7QRO3rICUP
         5eD8T18NKTS31Uyf7kyAXrxe3b47NXe1mHGAbgB8h80VNoR3SZXnVJwUSY/DOA4uS6mH
         72XFuvy0OanxZo07zbubXaSR4MEp7Ov/nGS+/rR5RB4rTR2vcRAQtZ7qhjCX24gQvAeQ
         NfZOr18Y41a8g7wX3DiFB/pn15b2qR7+GbBjvh9pz73wLjmcCteJ86bDkSM+WdREX4Va
         rVw/sEtgyemXEXcMRfoVdJZkdeTFU734CGckWaBrp26VOiV181T35iq7Njtc8XckGh39
         gnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761699661; x=1762304461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOFIBRmcwlFaN9bXxhzQe/4jdraVkcYuslQKkiUSHs4=;
        b=Iee3j8jcYgrmQRk250LnPvQTU5efTkWhMPAR3CVZaDpxLNztCcK03pAMbBM0hnzr5D
         s2lbSCI48VT/cVvwdDRzHcVv1h9wXSOahnmWgwmjj73mFhuJ/FpT0vWQJ6DKPa2+aI2g
         WPg6ciXImv7F/MVYPMbo7ifVgSxE0VCCDBDFSFa2kBN6B2PmqYmxUp4pYqCXBNhE/0sL
         7tBN7I0KGTyI2K7jRr/Uimxued72h5fvc9FvEv7Z/v2KJ06V5Zfp0fQKCObnKGM3AKLx
         HAeXVThG3+HVL3Gkx+wXDi8TV42GnbM8BUHPkvRB/L8w5wlVZoarFDImHdEFYs0SZj64
         Xz7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1mx7fCkIR8OuXZ2XT3mUEEmGKl+xOa3T39iYu2gpEK2OkLiaBq+6fIUtf1LtCaOtU5NYiaNHKNg8XwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoU7avzz513cn9+KmcNYvmnP1X4RRhx9XZpb1WBHiyvVu2jlw0
	VsUByKsM49zgpX8mshrm0BFaaFSe5TI8MmsoRePMRRozUp8pDST1ycNw
X-Gm-Gg: ASbGncum2eaG8NYKX0MvthJu+W62aI7G0Doy6/g6VecdwwWUGryNPNGuNwHv2dlcF+g
	bK+aOvds/T0Jzzgu62sGJcJjke3Hq+1P6xNSYzgpOjm4QzSf3Jh8Qi+GFzJGYqhna3wZ4c3tADG
	fPGXw0D4+D+I78V99B0BgvNXZrigLDl7lfSWD1faomGg3Jf8sKC7WYbOzYLKjM4Pqynq4PsliAA
	FNDLH7onikCbR8JRfdSsRaCHyxMNvnAqW1dVg4CEUvDTZ1svGAMM7/7iIK/319E4f4eFdUykJ5/
	o5nFKTIRbysH1sEwZQ48Eifjs7yAKJf+wfENt1Ha2awiBQijltPcf25oBvxB46zcDqXdm1BzhFz
	2TNzT2VomtSoU9UbN9qQarcJuwLBuRVkPSJ1Tn+o3D6CXpYId+hHD1h50TINaTDWSgdwhMJTiEZ
	3on44GRpbPSA==
X-Google-Smtp-Source: AGHT+IEMe32xqVGqKCj2DGI+hZvdmpFIC/0PTrMJHiFO3ihM2p5pLrA2hxJkIMoSwNxbQFCypenenQ==
X-Received: by 2002:a05:6a20:914a:b0:2f1:302d:1285 with SMTP id adf61e73a8af0-34657f5b873mr1069767637.17.1761699660885;
        Tue, 28 Oct 2025 18:01:00 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414015724sm13039315b3a.14.2025.10.28.18.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 18:01:00 -0700 (PDT)
Date: Wed, 29 Oct 2025 09:00:52 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, conor+dt@kernel.org, krzk+dt@kernel.org, 
	mani@kernel.org, liujingqi@lanxincomputing.com, palmer@dabbelt.com, 
	pjw@kernel.org, robh@kernel.org, tglx@linutronix.de, sycamoremoon376@gmail.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
	fengchun.li@sophgo.com
Subject: Re: [PATCH 0/4] Add PCIe support in DTS for Sophgo SG2042 SoC
Message-ID: <ilkog5axxgj2vexc2wegkpyyysrrcjhejamnpc2wmb3ilakbwq@f25veozfglr6>
References: <cover.1760929111.git.unicorn_wang@outlook.com>
 <PN6PR01MB1171791524E2BC1C227E342F6FEF5A@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
 <CAAT7Ki_4nkKM1-D_8ybwusxTTsR=Lf09v8Cx6QDWfuy8KLtbBg@mail.gmail.com>
 <PN6PR01MB1171739409EDE88BC4453D09AFEFFA@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PN6PR01MB1171739409EDE88BC4453D09AFEFFA@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_180102_020509_2E121C86 
X-CRM114-Status: GOOD (  10.19  )
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

On Sun, Oct 26, 2025 at 08:31:49AM +0800, Chen Wang wrote:
> 
> On 10/25/2025 7:58 PM, Han Gao wrote:
> [......]
> > > > base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> > EVB1.X/2.0 can be started normally.
> 
> Thank you, Han.
> 
> Inochi, please add "Tested-by: Han Gao <rabenda.cn@gmail.com>" when you pick
> this patchset for next.
> 

Just add the tag is fine and no quote, I can collect the tag with b4.

Like this.

Tested-by: Han Gao <rabenda.cn@gmail.com>

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
