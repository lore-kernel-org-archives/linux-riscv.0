Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E27606A329
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 12:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s3IT+wqv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ilSQr6+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mRk2e/I62rjWOgGP1BLIHuuAG2FtIoB68QOYpsEdI8M=; b=s3IT+wqvzR3KtqGFTuPpv8KJTW
	63Fre6LVFyhymlaMTu9GTnkrHGYebsRrZIid605yBL3iEMqZ1h2dslupaMw4aNztilG8VZMaH5gZe
	o4RJzVTA9Yk1dW8JtpUWZZtV3Eo/ECoUCvSFD2Tv5D1qGciuuCl5iSzJ1TzZurPOkeKTSP1EVAiYO
	LM4tUClyK4V9PVlWQAV8Tq9dtw07np93IwxipiFXjBSpW6obzhzeWc23T4bn2/jIeyhADctR3r3bo
	LkRo/+a67JBQBmZcuahK5VS80jWMcbv/oxtct+k/oCU5wfqv4X2wJOPSk4R0lafuii+ENsYxczhqk
	dFG1EPEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTICh-00000005c1e-1VC0;
	Tue, 17 Nov 2026 12:22:27 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTICe-00000005bzs-2UBR
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 12:22:25 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2e9d7791b00so45720185ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 04:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794918143; x=1795522943; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mntxBemduMZ5IAPGeXV9h5oyYqbo1gfqzxaQ3yOHoUY=;
        b=0ilSQr6+czn1TJorUmnPTlX68GyJBn8r3CMXYrNzpvewxL4QxyTL6nDtARzYASi3wK
         BugvEspXj+weicmCbr1S2wcPYnWxsqGm5r/pOMzTACE9uyeguQO4+7CbeLnA4Wgc/dGi
         30YWMscqT22/SE1V3nKOFIuVmPwbxhA4TeVVTExdnCt3XjRxBFbyLr36FAy2xbZzGKIE
         hk5KZU73U/MTKNGlBwCyjf5kuaDQKdTRtruEdfCY/dH0BTHe6uez6GDK9qyDJRrXv5uJ
         WjgMoBWVo+A2VnYAwsu16yY0Jr3oPe4IV1dEuoCKlrZGzqHa1tMPqzo2kNaTlhKfV1ie
         JEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794918143; x=1795522943;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mntxBemduMZ5IAPGeXV9h5oyYqbo1gfqzxaQ3yOHoUY=;
        b=Ql81MtBVkwEa9Bdbz73oI9V8RcGXYEtTYPVuxa9RYXEncS0YFIV8Vb9Zc4ISkJNWun
         UaLvqNQ1H30RSlo0zcBHTl5ZRS2qQqmpGGGgQZUDcI7ytq7Kg53JJo3+k2m/g1KXc7hJ
         U+kJa7HmjYstY+IBKnf9xv4FkmrgCJVCgibr4tuYYtQa6H8p2dnzEmtyxtI4DXwSma0R
         QAgkr6KEpUjBgL70F2WmSBjxpyCGVzATXMRQf0ioZViUquIK3iX9e5/XFsnT3pegaYF6
         FCQGqKsnRVf9dvG2ZUAg3rTFWcUdag+HdjmE1QrTPWXVcsfONdHXk/Luw/zImtU1vTVW
         UuoA==
X-Forwarded-Encrypted: i=1; AL+hErGe+Od/Et3r+YU4stj1S3LM+mcM6nfkNMGjUDNZp9QhfVwcfrR6En8W/Vd82CUH/56HkHL8FLUiPW9AJg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8OOvs54JXArrBLjgvkxen6C4WaFRCDoSyfiq2aeBsyFpADcHxX
	ox5aO5fkLYvAu3T8c7aBRnlSew8hxhATmTpfasl0R/Hlw4JIwmrNgiIB
X-Gm-Gg: AZFdTZdoztTmJQ1aSZcrVWi6Nhrf6ygnpKy1uArqyZrTTdtEhZKYnyTgXRRs2tjBpEb
	tSOpEI6fVfiipExBZgXzC9nWYrY5zvuU4zaoml3/PXnEQQsyxbbZ6/wObKW2qBgM402Q+i/b/zy
	uKscllTN9Gwl26Ml2P7gMphmZpvxikpG/JvAzE5LwcVJBIKohoYXXnZkjrpXnqBS3NrXvx7LOKp
	S6F6fLL4rMuXDxLClcTlJG1XnmT5iMlI0yWVj9hWj0252sQoeUqiXYNL7J+VJEE4HmiCd428oin
	blhIGPmQUHSkBCNDvWAyl5x1bgLiq5TJWz1ZHPr9GR1PsSHrJh77uqmk0B674kdgwXfThKkqvzg
	AsTH+w1QuBkC3wXjQg4dq5q49mHnLkctEssi2zCr85ZVm9U5N3e8d/2RpVX6trJrb2psAdX8CGU
	DZQmOB2MoUDG8qPoh+avq6IPIoSF9ldmPZ8WlEEQwGXUNVCxebIreM8D95M8RgFpOUwOHjP20OX
	FoQxgNcNlRQNFEjgbgIpATadvUG1JETtZrjn6cbwTHYAKl4KcZVYddjWd2fvIkXg/FBuEctrST0
	h0wV0W1YzJxZk7IaTt0wZgcQt+Se
X-Received: by 2002:a17:902:c40a:b0:2e9:5059:4468 with SMTP id d9443c01a7336-2ee0d664b4emr129370335ad.7.1794918143343;
        Tue, 17 Nov 2026 04:22:23 -0800 (PST)
Received: from duge-G3-3500 ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d86a1sm14701045ad.8.2026.11.17.04.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:22:22 -0800 (PST)
Date: Tue, 17 Nov 2026 20:22:15 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc, 
	aurelien@aurel32.net, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <gwtbssramb3rnp7dgqxm5fu6ywkn2h2jigdh5dvj5fvtv7rktk@upytexvwkjaq>
References: <20261116075423.1519438-1-duge1256@gmail.com>
 <20261116075423.1519438-3-duge1256@gmail.com>
 <65f843b0a46f14df575d998acceb40b68fe64a62.camel@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65f843b0a46f14df575d998acceb40b68fe64a62.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_042224_647170_05BA434D 
X-CRM114-Status: GOOD (  17.07  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 12:54:42PM +0100, Philipp Zabel wrote:
> On Mo, 2026-11-16 at 15:54 +0800, Jiayu Du wrote:
> > Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> > controller. These banks contain temperature calibration parameters and
> > other configuration data.
> > 
> > Keep the root key and SSK registers outside the exposed bank ranges.
> > 
> > FUSE_READY reports completion of a software-triggered reload. Trigger a
> > reload through GEU_CONFIG bit 22 with a 1 us reset pulse, then poll
> > FUSE_READY at a 1 us interval with a 10 ms timeout before taking the
> > snapshot. Fail probe if the reload times out.
> > 
> > Snapshot the shadow registers with aligned 32-bit reads and expose the
> > data in little-endian order at controller-relative offsets. Serve reads
> > from the snapshot and use keepouts for the remaining register ranges.
> > 
> > Enable the AES_WTM clock only while accessing the hardware. Leave its
> > shared reset deasserted on teardown because WTM_RST resets the entire GEU.
> 
> I don't understand this, possibly because I don't know what GEU is.
> 
> What is this reset shared with, and why exactly does the reset need to
> stay deasserted?

GEU stands for Generic Encryption and Fuse Unit. This reset is not
shared with another consumer and only resets the controller state.
My explanation about needing to keep it deasserted was incorrect.

For v3, I've switched to devm_reset_control_get_exclusive_deasserted()
and removed that explanation. The reset is now asserted on driver
detach or a subsequent probe failure.

Best regards
Jiayu Du

> 
> regards
> Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
