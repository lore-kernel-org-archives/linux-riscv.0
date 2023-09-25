Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4491CE7A81
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 14:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qKMHaxh9wVZ2D0sDgy2VXT7WvVo4wx9VDFYrpGoJfWY=; b=A5ep+jUFJtz717
	oVLFeQ9d1Ix88QVrMaUs+P63GJ6p12fEekA6ihoepvx6l9WTTao4086LWuVG701BSPTQzlL8DTeBZ
	9AHORJyyy7MVKPZd1nSEWd4lSKCQ+fHIwrmUWEdzt8nsEo49wK0QyiAp9i4FNCNKrlqjxyt82p6uk
	rvdHf0M4ZeZJfKxDM/JrnlSo8Ze61tqKPq6BSc7JDretor8IcfeC8WmMQOJMeLTPvLTFrq41VfZ52
	Ci8cO/oTXQqZo6Kp9E+Wi/hl1I8UTPqIglBUudeKONXxbVqvcQdR6OG32r63VVl9VnRBFYmgeUpi1
	hSmnfAp3HZsuxLTWR8Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkmNp-00EQLy-2y;
	Mon, 25 Sep 2023 14:16:21 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkmNm-00EQIn-2n
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 14:16:20 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-53447d0241eso450054a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 07:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695651372; x=1696256172; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NtHT6aiMIDBr0VhsvuAUelOWNt+yCga/yEkC3vej9HA=;
        b=XVfaTrpIUiv4g2HVgfyeqUHrGReoC8UawtHTav6o/qWSmRjWigIOXA9idzktXo9AjE
         JHOSmbw5elwgHWlg9MBEXUFbrWi7HK2KY9ukyu1nThLrtadFSjeGg6/HkdA0UdORfX6G
         JDcqJ2dQDjsGMcDXEJVLRVZAdqvQKwUE+N1DgghdslC+PDxIa4ftAUANZDAuoUVvsKKs
         sSGKr8uzqR4Gk9qsS3je0klBrKYJ+MVaPajPe7IfFgsWp4jv1HDvYCTEYqg2tfD8ax58
         JLJ3oD89SXhfTT+opn2IyBab6frb3UgxLhS3MqdgYh8WxCMMob5HwHoOQiWFpmmPiOsQ
         Hbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695651372; x=1696256172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtHT6aiMIDBr0VhsvuAUelOWNt+yCga/yEkC3vej9HA=;
        b=cBMEd8bpgjlSqNc9xr1fSOQVvDGuBZDxdiuuLEvNDTptEKo5ezBwZIDDn1jc7NpxQ9
         hRSO6z0g8snujKzKUEWZt2C3JbGHcCJe/Duc5PLQAu+H0VC8vM5HQrU163sR0flTeTXN
         kSTyhvoTcp4QlqEBytr2F2N6cd2Cfr4gDiZ1mY7faslOl3404xDpODY9k8S7fJRO6+Sd
         tUtaTw9cY9wo3Uxss5nFCfLHSpO7sWjNAkrDs2qjsCB8uapLz4rnWOKxFm+ftTOjGh57
         sI4JEWopJlQnnGbv/Ne5gwKX9O0qKhKBQH3moO0HlQDOZkaXaqY1xQ9YN3iVPtKwS/uT
         cN9g==
X-Gm-Message-State: AOJu0YzL1rAZmtOlDKyoi2itCddT5f95/eKgeWnELDZ4FEJol6iHT+Ew
	K7AuK+hMPjbdHDpS31OzBrz4hw==
X-Google-Smtp-Source: AGHT+IFD3EpGZBsAbJ+J5vxX8ZTKeYXM/hyB7APD30MTz1CFpgRcVl20BIQ92V7DyV6X8ncqPzNWDQ==
X-Received: by 2002:aa7:d1d0:0:b0:530:a0a9:ee36 with SMTP id g16-20020aa7d1d0000000b00530a0a9ee36mr5827166edp.38.1695651371793;
        Mon, 25 Sep 2023 07:16:11 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id q6-20020aa7da86000000b005307e75d24dsm5531414eds.17.2023.09.25.07.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 07:16:10 -0700 (PDT)
Date: Mon, 25 Sep 2023 16:16:09 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Shuah Khan <shuah@kernel.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 9/9] KVM: riscv: selftests: Add condops extensions to
 get-reg-list test
Message-ID: <20230925-3ceb6ef98455349935bcd504@orel>
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
 <20230925133859.1735879-10-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230925133859.1735879-10-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_071618_901960_8B451958 
X-CRM114-Status: GOOD (  10.96  )
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

On Mon, Sep 25, 2023 at 07:08:59PM +0530, Anup Patel wrote:
> We have a new conditional operations related ISA extensions so let us
> add these extensions to get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../selftests/kvm/riscv/get-reg-list.c        | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
