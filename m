Return-Path: <SRS0=5Ln/=PP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03F1C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 21:52:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF4F92089F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 21:52:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TDUommpv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SdCjpufk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF4F92089F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkfWPfBDAh3QjM4sTDpmlQmFmDcEQAnkjOa8kWCL10M=; b=TDUommpvsVozt3
	/NxMGbJtfvNg+ZhLeZjrwm/kQBGrjA247QVmaqubW3P3a0GiQ2EZw/OUdxXxs+klRTZAhy44p0KDE
	eCwv2E3QuUcDJ6V8Jmkmuy7ZiaJHj4asoJWQGgfgChjrYrov0o6dsnIG65n1RIpJIJE0SEsoR7o7X
	trlG0R9/cp53fImmZN4iU8Fp+ojoVY7V1n5BVKcCEvpOtrEHFPw/tD9OYZCtWeK9ZVuiAnJ0GksaM
	rrDViHzqaPWq4a7VMTeSQ/BacO5zs+xIjYDxb+n+HsKWfwsOoqD0hYJ5dTv+Jhc+Vruhg7iCIV8FM
	eVX4Nvq6qKFAQQwYSXew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggcp3-0004fX-RY; Mon, 07 Jan 2019 21:52:37 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggcp0-0004dL-Ku
 for linux-riscv@lists.infradead.org; Mon, 07 Jan 2019 21:52:36 +0000
Received: by mail-pg1-x544.google.com with SMTP id j10so740902pga.1
 for <linux-riscv@lists.infradead.org>; Mon, 07 Jan 2019 13:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=TtW7gHakHMo6LxEIUIwTgBtsYYww6wIcuI/nEnmzPrU=;
 b=SdCjpufk2mxWQhBsKlcmLXb05sfkyTpqXSNGIw/mGMd17PQgwikjCbm/wqoaJ7Lc/5
 XfhzgEczlpjhLBlQTSmW5DwIkraZs6EgFlxTi1VxV6EZqQ9BfEET1xpzqW/VckLYcRyc
 2e9EcKj8srqc8Nwngrpx5cdAHxV4kmBydtNEcpewKppl9idUE6iRFe+I67N1D8R7MOMM
 e7y1o+ugOQkmlbMtGT67R+uQu/z6eKXgGYDtH3PzhdDoXMlhw1JT23BRkCuLgDberh34
 Ypl6hKo+siCaOVN8hmTjaQmuNbgjU1b5T9v7Ba6l/TJlyo+IfRVV1DscdZivzTJXEyB/
 /6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=TtW7gHakHMo6LxEIUIwTgBtsYYww6wIcuI/nEnmzPrU=;
 b=TfPoMm0TMZ2UYUsb8mEMt7c1gQrwGIhX9JqYC/yjHJasKXDfj6xK8rCtZHRSd+zg0Q
 raL34xR6czlQ447X560EPUtCYTpG2XR/Zzky4Yjme5diAozxDVT1WAV9nCrIlQBCS1yA
 54OMPqFGm/KOpudjEAAXgBZzUWhEuyGQitnBVZ14/5J7sIzYDvI5Hq96eF0xbHYqlers
 SDY2HQgz3xtgZsg4FL8ZtmNdmUz8Kg/dOxuw9cOaT+4zH56aXBR+I2J9GYHM/RkA1rG/
 Bmy6987/hICDLgQ5euRekiZSmFvgMbsfO6D3giozvwfTNlWJYgFU7GlVBrQG7Vt6PlYk
 3HFQ==
X-Gm-Message-State: AA+aEWZ2QH9oebzOmvrk4LUPOn2+CrVK9mgVOh+cuzr8uM2NdFVyiSzd
 0VTDTYJHMrtcZtyrRJ6p6esdYQ==
X-Google-Smtp-Source: AFSGD/VyK06sZuqbl+VfmLRZbR0GAvssIKB5GYwuCnF5TGHoawnvrHIXsmZMpUT9NFnVQlHVK5e5vA==
X-Received: by 2002:a62:1043:: with SMTP id y64mr65498563pfi.78.1546897953783; 
 Mon, 07 Jan 2019 13:52:33 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 7sm232091484pfm.8.2019.01.07.13.52.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 07 Jan 2019 13:52:33 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Mon, 7 Jan 2019 13:52:32 -0800 (PST)
To: Alex Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH 0/3] Hugetlbfs support for riscv
In-Reply-To: <817f0993-b200-e484-752a-53df28e846ea@ghiti.fr>
Message-ID: <alpine.DEB.2.21.9999.1901071351180.14547@viisi.sifive.com>
References: <20181210062146.24951-1-aghiti@upmem.com>
 <817f0993-b200-e484-752a-53df28e846ea@ghiti.fr>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_135234_754917_DC2483BC 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, akpm@linux-foundation.org, catalin.marinas@arm.com,
 palmer@sifive.com, ndesaulniers@google.com, Alexandre Ghiti <aghiti@upmem.com>,
 atish.patra@wdc.com, linux-riscv@lists.infradead.org, mingo@kernel.org,
 mike.kravetz@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 7 Jan 2019, Alex Ghiti wrote:

> Can I do something more regarding this series ? Anything that would ease the
> review process, do not hesitate to ask.

Does your series need to be rebased against v5.0-rc1 to apply cleanly?
If so, please rebase and repost. 


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
