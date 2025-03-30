Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E88C28B20
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Mar 2025 10:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h38s7Fok/oW5Q+doP34OUajNNIRRGxZ4P7CjahylTU0=; b=DjII+Z9L8bMkIo
	eQk0iPl0FGBFLG5MhJgXjzqG4SLaWjAadPuwYJHwvAwtSKcjOQ7j9DsUt69CMRADtoiblmDkF861Y
	WbmDWRiZaV/TM4tTk+rDwrj2Q6J2v9V8yHB+2Mg81zppR0XGmgZsJBooDe+UpARW9UlW4cj7+Ub2X
	suNpoG1jFNfSkLgMpy6uYB3a6P5WpQiszCb8gO1NRsjZwEpiZ3lVL09maf4w7URYAm8W0YDcRFhkB
	onbIic0alaWCk+JnvEraBoKoscI1nHlK0A7dwhsAHzP97AtshbhJ60V1TPD3drg/rvBLdarUVkS2J
	6IX+Nswsc7Qj5+0nyFkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyqGX-0000000G6kz-2x8Y;
	Sun, 30 Mar 2025 10:51:45 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyqGU-0000000G6kb-3rCX
	for linux-riscv@lists.infradead.org;
	Sun, 30 Mar 2025 10:51:44 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2241053582dso41317615ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 30 Mar 2025 03:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743331902; x=1743936702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4Dc7903aqUi7QARvZQkiVZWl5zvBm3/ivRJbwdI5Nw=;
        b=XN3zqJYumfJYgE9vVRUeR8ESfcoJIYrKd4EGPxNDvUQi3vpOjfHV0gtz8ihK404bnE
         166VghTDH6DoASrqVJLNXKfOb+4OS4pGAeVOMZGB61OCWqdMF9TAx0Llu4bLZRr5p+uz
         NR3YL/rBH2hhFigRr8rssSRMU8HkcPPJc6NXpOUkqgau/9ralNd+LNCtpDZ5UgIagp8S
         QoW2ubrR+FUBMSta3nVak4xQX/OWv6xjYL+k22Nun2JW/Gshb4v2j+KdXiqCjOUtgHpF
         xZIBhJ/pBjhoMmj+UifzaKUb8+hpGMJQ6JjNFdp3gwbMpvCSN7UVbIKd9cok3PgkmJTI
         2yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743331902; x=1743936702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4Dc7903aqUi7QARvZQkiVZWl5zvBm3/ivRJbwdI5Nw=;
        b=R8BSCBRuaHphQSXO/zflON16OTRGaDmTwgcJPR2SeoCXKbwjtNc5XvmL5UopZJgJU+
         NBBgpgw+T/FPLWB7O3uYtrGMmYm6DeRUJ6oXUCqZIhF0QtA4mg5HBt5xIbcPHD//Xok7
         p1C/d2SoHiRz9CVqFbPhYVfIvF6QZ5CPG6TvS4xBgGSDpM+mE3zyI5Qy+4sZCybr0qSI
         pv8jp7e2kjY6a96nSlK/yRDTurBdc/85SkgGvO5uvzj8kWEN75jRGEjQfycZdFG2cuRL
         EBoHPn0+a83aRyxlV+5EuTw7WIKTj00BW65+rh1kNMht+f/QkLPYs7PdK4i3S4ZDSUI/
         3QCA==
X-Forwarded-Encrypted: i=1; AJvYcCVVueTSw0TG54WDE3ZW+QnFvZbQUU10GJ0FCXYH2Ix7vrjsLOaYU2Z4N33+2JvyTzIAOT7Pjxx0ZYmiSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhEtltkFCASW//G9u3iomZAfeszV4ta/RN4bX8b4VhdUJb8LhS
	0R08Z4rrUxA/vYW8tV/VI1/zMSgO/dMzQ7CGgApsfpO6zMZDLH6a
X-Gm-Gg: ASbGncsDH3wbQMR6zYa42/DacUvj+pJSd8ns8XSvz6HVPX+dKeE0CQLpLnA5xrf8StZ
	FF0Atx2fOs6UXSgGC3CFVoiic4ETF4JCy7sDKAG5gIirhDXhMBCFvyUq2k4goQe7ZfDmPrpd6DM
	mkB8b8JSjjBi9LgnsCI+FQq7c4TjChKDANM9fFh9qe3xB1U7WIYrwtLto4HWfu9pMLcX8AJFldS
	NbUb6PWy/ERIx+2YZMoXDc4Jx2L6lzkto7lKASv6+reRrKp2CO2B6USEyWjLvj+3LmLnpeT3ZhI
	88Mk+4B4Xwe3sE5KK8FMn0c7rOuI/lybHDDpnlwgj65h4xiUnxBK1Zj4LhlnXm1WyOAVO3SyDxj
	vwclSE7g6/IynJGdOEr+9u+kN+smeYRx3Z5AHYbR74w==
X-Google-Smtp-Source: AGHT+IGlynswCVf1Afq+yxlrKXxYS9eorTi2vj1TP03egLwpQVeJSiv1lInIOi7BBKDsQVKxiyXUiA==
X-Received: by 2002:a05:6a00:3991:b0:736:ab1d:7ed5 with SMTP id d2e1a72fcca58-7398000b471mr6908974b3a.0.1743331901818;
        Sun, 30 Mar 2025 03:51:41 -0700 (PDT)
Received: from DESKTOP-NBGHJ1C.flets-east.jp (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e1d922sm4991601b3a.37.2025.03.30.03.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 03:51:41 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: gregkh@linuxfoundation.org
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bigeasy@linutronix.de,
	conor.dooley@microchip.com,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pmladek@suse.com,
	ryotkkr98@gmail.com,
	samuel.holland@sifive.com,
	stable@vger.kernel.org,
	u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v2 1/2] serial: sifive: lock port in startup()/shutdown() callbacks
Date: Sun, 30 Mar 2025 19:51:35 +0900
Message-Id: <20250330105135.389827-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2025033015-blanching-pagan-db09@gregkh>
References: <2025033015-blanching-pagan-db09@gregkh>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_035142_960099_51DDEAA3 
X-CRM114-Status: GOOD (  10.98  )
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

Hi Greg,

On Sun, 30 Mar 2025 09:30:27 +0200, Greg KH wrote:
>On Sun, Mar 30, 2025 at 10:16:10AM +0900, Ryo Takakura wrote:
>> startup()/shutdown() callbacks access SIFIVE_SERIAL_IE_OFFS.
>> The register is also accessed from write() callback.
>> 
>> If console were printing and startup()/shutdown() callback
>> gets called, its access to the register could be overwritten.
>> 
>> Add port->lock to startup()/shutdown() callbacks to make sure
>> their access to SIFIVE_SERIAL_IE_OFFS is synchronized against
>> write() callback.
>> 
>> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
>> Cc: stable@vger.kernel.org
>> ---
>> 
>> Hi,
>> 
>> I'm sorry that I wasn't aware of how Cc stable should be done. 
>> 
>> I added Cc for stable but please tell me if this patch should be
>> resent or if there is any that is missing.
>
>Please resend a v3.

Ok. I'll send v3 shortly ;)

Sincerely,
Ryo Takakura

>thanks,
>
>greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
