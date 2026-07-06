Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEA5C43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 19:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v/y/zaihtNNTLwWhF6eweIgBom89VSmn3LLkfzU0lvE=; b=KPvkm3MkQAu2BM
	w8nvxTz1EoVreXMwBhzlYF9pvDuSHfEH4jWWnAheX5K47x2Mu4U0cgULS9agmCjxstjVcNVoOWxsl
	+TOPefBmP+1/UJGZS4ZrXRh4Jr+jnUO26jXqXuBDpQq+rWk2d07L51h9UtcANblbr24WpOq6f6+H4
	vdJm6wb9HXuofWDkIsyDfL8SWqmx0r+qNgPc13pxwALg4BT/DgB6J3kAw1Ps0vtkYMucnSTvut1tK
	XoxY7tX301WgdEAGSqQhqTL8NzSeUkLlIHLtQ9O3OLcsP41ZgaSHVd8+QxwDOXGlt7/+qSDH+Trw1
	N5NPiPQDoywayT9hmh1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgp0J-0000000DQt6-0cX7;
	Mon, 06 Jul 2026 19:29:19 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgp0G-0000000DQsV-0ysD
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 19:29:17 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3811e59df58so2077929a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 12:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783366155; x=1783970955; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SdqvWMCnckb6C/qwPHK1OCp1P59kDYcpUso5dVOBat8=;
        b=giW+SjoWWsLLZBaPxd8zvY5Opl4uhKsIOagQ3+CQzciyWC7dp02oSi3KJjmEa1SjZV
         yd5EsVgxL/C3cqO/q0cmSsdQOhl9pzNXCc9gRZx2PviUyunxgX0YjxoIU3jllUUMSxeg
         NUsR7PvO4pXMc6bALi7kLGVzvjMMvwWKEWrGH5QtBHiwUDsxTxSOlfEBpQtUclL87pnW
         Na8SEdDQQUdgpZhGtqXFj0u8eS+WbgPvXNhIkC6keIBm0qHrbLE0UKm0tUEkD5VqKfn6
         VpddsXyWz8bIQ85hsX1teU021EjrlZegp+rV3V58MUUJB55zzrWs+gK4sltme+eVFbMC
         dhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783366155; x=1783970955;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SdqvWMCnckb6C/qwPHK1OCp1P59kDYcpUso5dVOBat8=;
        b=JoX7t+64cHopTYPQVnrfpin78cgVemjiJrtoj33lA08j0pHd/+xRyxp9RDIZlOIepq
         ODkqX/DUJkMeXt9Sms6fj0GEqZl+ixnrCBfJpt1t8bmB0QnNnYz//piBUuCMkImYkZPY
         LPFokbjVSD5hjtls4hDrB6mjpM4K3nz695vqE2Jtk1K/p48GfxuEZUQBD9mjFrm+wz5i
         9IMvoxsbE7iB+l6gwoUlyIDXXbbGUV7gqFslLCoksR1bulQDqwFgShN0x2tF4gs/mxCS
         eMg+mqTuq7ZCEVUSJbkWnnaEYaya74sr+XBnPK5uLg+mGXNaUQCFwfebTUKUzsiNm8lv
         VYXA==
X-Forwarded-Encrypted: i=1; AHgh+RoerfYTpzjrj2VjVrCrdy39upl46xEJo7vqiW44KoueVqYobsu0xq/2jnxpra403DW0ntqUqmN/+qn+0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeC7w9/dp0tuMQI/YGWlgf2c5ejGjY4Rh5K6j77BpMm3Rk9+MB
	DOCWo9Z/8SPQE9j8C4cWg6vWg1OFXv9cv+7IfXZ7yDE3X+3zCXcAyTwu3dumONnP
X-Gm-Gg: AfdE7cl78KVlqvQCS7I6GyxHL3ERug5Cy7VHv3dVIKn9Fi/THy/owa25hGaWZsN34J8
	ADyonDT5PV1TUyB1EeK1PjHZ4erjNO01c15c61IJUz74iGdlfCGp6rVPTmXJRHW4IsipDNIesjY
	xg8iHFjeW4FMhw5tOilHRTGaxezmc6qcK12aqasuU9iIBNNsdtIABw9IaK4dIdj/EtogodpVt8F
	WwKMAbhevV6v8+p22DR7fosLUQeNY2pcLJyOz3rCu9Exj9pT9j/UnYYuy/LoRvPH9JGb5NJDUyL
	p7SqMfboiCY/yiM0DFBd+DK+QJo6zQUHFpYj3NvVcyoaZpkEzXWEPw94wRBQ2+D4wcU8qwMxIHd
	Rpi2z1V0hfkTkaP9iHyvOCSChPiEIbZHx/u9XIzge/r0ELXO+eoGW21aOMnrU1D9oSHrYO6ZQX9
	gfe3xOgX9a0N7S1wQBW6u2najp+CZUH6Tb4DlcMR14FJyZP9DZ1FhOFMxe/bqNVL6ER3eRmg==
X-Received: by 2002:a05:6a21:2c11:b0:3bf:49c8:f69 with SMTP id adf61e73a8af0-3c08ee6c976mr2081583637.39.1783366154882;
        Mon, 06 Jul 2026 12:29:14 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:612f:7084:be32:532a? ([2620:10d:c090:500::1:55b9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb7fe46sm63762700eec.14.2026.07.06.12.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:29:14 -0700 (PDT)
Message-ID: <d6647f5eb213d2ece82753285a79f28f600420d7.camel@gmail.com>
Subject: Re: [PATCH bpf-next v4 0/6] Mixing bpf2bpf and tailcalls for RV64
From: Eduard Zingerman <eddyz87@gmail.com>
To: =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Pu Lehui
	 <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau	 <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song	 <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh	 <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Hao Luo	 <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Puranjay Mohan	 <puranjay@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt	 <palmer@dabbelt.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Pu Lehui	 <pulehui@huawei.com>
Date: Mon, 06 Jul 2026 12:29:11 -0700
In-Reply-To: <CAJ+HfNhn9eK+3xsd3ewEsG-duCgBeYXeLAtNan=qefas2Ya0dQ@mail.gmail.com>
References: <20260629140048.733346-1-pulehui@huaweicloud.com>
	 <CAJ+HfNhn9eK+3xsd3ewEsG-duCgBeYXeLAtNan=qefas2Ya0dQ@mail.gmail.com>
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_122916_302653_18D88069 
X-CRM114-Status: UNSURE (   5.66  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDI2LTA2LTI5IGF0IDE2OjIxICswMjAwLCBCasO2cm4gVMO2cGVsIHdyb3RlOgoK
SGkgQmrDtnJuLAoKSSdtIHdvcmtpbmcgdGhyb3VnaCBicGYgcGF0Y2hlcyBxdWV1ZSBhbmQgaGF2
ZSBhIHF1ZXN0aW9uIHJlZ2FyZGluZwp0aGlzIHNlcmllcy4gV2hhdCdzIHlvdXIgc3RhbmNlLCBk
b2VzIGl0IG5lZWQgY2hhbmdlcyBvciBjYW4gSSBhcHBseQppdCB0byBicGYtbmV4dD8KClRoYW5r
cywKRWR1YXJkCgpbLi4uXQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
