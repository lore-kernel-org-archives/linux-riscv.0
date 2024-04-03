Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C42FCD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmrbOvBun7WT5AnplXSn0+OhxxNQ0fEZCHB3Zq1wPbY=; b=qW1C5TGuGtEny6
	MVqwLyOyuJLtvkfECm5M9WUAj+4WYJBFR+ZXM4VpEe5mBww+6hltuduwRmiHtrBUy0cOxeRlsX0Ds
	TWb0zfkahykhafons5XPissL3iPIr7W3ccqTGxtzoEqpyC81rYHkFXL0f1Nx/HjBD4+lLho11v8Gh
	9/9Tbq/Yaxi7tb2hfmt3WakCtI99yeKEQeIBmd6pFZFYPLLTnNQYFfAuEDYFZcKRYlmqF2wF0l1DF
	p3f3igFkylxcjijtVwJ0V2eNrnaIAvjdV4Hq3BMeM7rf5ODepYj+ruFtUV5/J3MqGd89RaxCE06m5
	YwhI9I/QOVE2oIwvvAkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs9uv-00000000Vrx-2Ild;
	Wed, 03 Apr 2024 23:21:17 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs9us-00000000Vqp-33rh
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:21:16 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-430c4b1a439so2139101cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712186473; x=1712791273; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvwDj36J61ZlTSHcZL9odrv5keRm6neVOdEzwiuBeJw=;
        b=m7Us9tJ39eCz55a/jJNLPfpI9TxraVxLwRqs2vDTjiuX210vdYbAuLhDsqcIKqFXjq
         Dxj4RLIHWwul7SWSLRQThSFdKgmem1JF22lxsMPlKRoEkd/jpfjCUm+XZBOD0j26X/dO
         LqwptaPmwVZRDR2W3zjF+c8s3SuyCyvH9ViLYsdr70gAkN9hcNeuuGsOYyc+eOeDugTm
         61/RfatcYxIYv1gfTMqv3mPX8IG6Rc9EQ3dxzRn6ZlI149gfNt+KF3chLtieRDPdA3hO
         RgrNyvyYNBcUVzbUfzK7P7Q0PudrCbfwsBMb22QIRO9p3HvbBHCa9oO2VUrK0m6mFo4O
         GMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712186473; x=1712791273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvwDj36J61ZlTSHcZL9odrv5keRm6neVOdEzwiuBeJw=;
        b=VPBEMXzzD+q6bFia8T593vJ4uRfX/kQctMLFOIm4+ekr0bUawdq1qowxoNgyINOBzr
         KCNkxd1mGuyzdNU2zBHi84W6PsXAjctVB/ctfNSQein3NAfBDzXv36zJFH21e8cEBoTs
         HUCEAp5oOiE9Xc9TuW4rCIBms+otLHjU6eGFGEO3FIblWRMneGpuxqhdbJKrBVF01HlM
         JT3/RFY8wM5EOKRDDp+Kp0EnlUK8Wz2dG3D+DZr4O7ePPrqHQGYm68vPlUJuGIDk3o4u
         Lk4p5Ie1CZNpJAnJDLTTfDS9VHiwnIqxpaInhADH7o+ZSk+3sGjMSWGN3VQv+XX9ecto
         ndmg==
X-Forwarded-Encrypted: i=1; AJvYcCXOLjtuH2cYK/UzCpEU/E2nlilXedqSl1yJEeHGlaDziyomZJNJs5E+9PI5qKtMorK1y9MrUKLwyIJPzQ2JG1zh58zNWn6BqLfBwsbS5ZOE
X-Gm-Message-State: AOJu0Ywg17yG/0BNeBZEkh3sLDn09vpMJmam+Rv6RiV9vFHqSNwl7/7i
	hEHxTkzxaRi7AZSbigtZL8lKqt3Ew7lhGVWzCSe1EYqewBYsd/Iz/Etr+9dwaegUbuosqBpFDdw
	Do4b3HHUKh+2+vXIat8adPiamLJhsGnCYnJARBw==
X-Google-Smtp-Source: AGHT+IHTWS3wV6Oi3dcV6kh4MygToZ+Ok2H5HYECZyyamnaf+sN8wFntwNrkWZYUc/5FBBdotl6Oi8jVDoUNbIH3k8w=
X-Received: by 2002:a05:622a:148b:b0:434:494b:c69a with SMTP id
 t11-20020a05622a148b00b00434494bc69amr757146qtx.61.1712186472901; Wed, 03 Apr
 2024 16:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-4-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-4-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 19:20:35 -0400
Message-ID: <CA+CK2bAKVEGrXPURWyyssmq_qx0aj-MCPVUDAkY58w-BO71aMg@mail.gmail.com>
Subject: Re: [PATCH v12 03/11] mm/page_table_check: Provide addr parameter to page_table_check_pte_set()
To: Rohan McLure <rmclure@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, 
	christophe.leroy@csgroup.eu, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_162114_784836_B7BB739F 
X-CRM114-Status: UNSURE (   8.12  )
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

T24gVHVlLCBBcHIgMiwgMjAyNCBhdCAxOjEx4oCvQU0gUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxp
bnV4LmlibS5jb20+IHdyb3RlOgo+Cj4gVG8gcHJvdmlkZSBzdXBwb3J0IGZvciBwb3dlcnBjIHBs
YXRmb3JtcywgcHJvdmlkZSBhbiBhZGRyIHBhcmFtZXRlciB0bwo+IHRoZSBwYWdlX3RhYmxlX2No
ZWNrX3B0ZV9zZXQoKSByb3V0aW5lLiBUaGlzIHBhcmFtZXRlciBpcyBuZWVkZWQgb24gc29tZQo+
IHBvd2VycGMgcGxhdGZvcm1zIHdoaWNoIGRvIG5vdCBlbmNvZGUgd2hldGhlciBhIG1hcHBpbmcg
aXMgZm9yIHVzZXIgb3IKPiBrZXJuZWwgaW4gdGhlIHB0ZS4gT24gc3VjaCBwbGF0Zm9ybXMsIHRo
aXMgY2FuIGJlIGluZmVycmVkIGZvcm0gdGhlCj4gYWRkciBwYXJhbWV0ZXIuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1cmVAbGludXguaWJtLmNvbT4KClJldmlld2VkLWJ5
OiBQYXNoYSBUYXRhc2hpbiA8cGFzaGEudGF0YXNoaW5Ac29sZWVuLmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
