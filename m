Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBB6CD1288
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 20:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SJSXHCmmTtk/C253Mr5nPrrQX7QZiTviBj201LxC8PE=; b=v/j4y2xiVmiAtr
	jrGcaMm+3wLqSHSV3PwsiwVxVsw6kuMBQ0SDnWBMJR3FCRzKwSnPJJM1k0ZGc0Sfk675R4DCyuEs2
	UJxgobl0tf7v2ilIpQV3NGEp9c45k+kXS/IShrYAV9sXFoVS4UhX8nZWrDOnYCTJBZ0XquOHih/kc
	/XVSeBhfNKYC1tEQQQNxFUVPZQ8TesPQNhSDC8LAekyuv5ZR4dQ5HHj1aGo8x3KCOUNlAtSF+me9h
	9Upj8cz11CE+jRKgd+YJjdYNOsXUwEeaooH0KwpmGLakSiKfVyRoA9kBzEtFAbPfY7UNQUKa/Jq/a
	UKNpJObszw4ETKVCqYFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsTnD-00000004DiV-41SB;
	Thu, 04 Apr 2024 20:34:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsSeG-000000041l9-0haj
	for linux-riscv@bombadil.infradead.org;
	Thu, 04 Apr 2024 19:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Dl/FopeODNdULB5NSwrsajN91zng/VnqM090COn1yWc=; b=oszznHCNM9m4AT4jOAnVoySlVq
	UFuEMUZM8lFlXRxTjCd6YTCc0G66Y4QnLGtLPYCSe+X3gghfBo33dDednLqKiXgsIs62lXbsTeG5u
	BUpeKYn/hiogZhL/5kVqhDUpU7TWrXUJ6su2XrbrnSvuw7LBbwKbSkK1T2HsmCCDhcYPLGTgBYuA1
	bPr0klY2DDmoT/Gknjl+bhharHCuuZH4Q2lskgk+nPRt67TH1MNEDpv9YFaIK+Nfd/Lf0Gz5jaaMG
	PPxK2VbwRqI8sK/x5zUAu42xIEoIPUs3JGkwxGBuGZ8FzCjuIVX/uBHK91hVcAJGbUKqvqiehG1fw
	nMYIRhOA==;
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsSeB-00000005DYi-1PRs
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 19:21:18 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-614b02f8ed6so21959347b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 12:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712258472; x=1712863272; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dl/FopeODNdULB5NSwrsajN91zng/VnqM090COn1yWc=;
        b=iJev0DBgO06Zxakk3dD+hTrtDK5OLSYqCHAVJahpwY1ROqheH4GH7EAl9WJ3xARCMG
         gs/XMNlqEe4/tESa/XS8cMK1NA3aICRpqPZI0rJhm1dgC2vVrmuY0k2p8iHB5bgxh4JS
         HF1fua3TGqJSKDMTla1zlX4mMh6Uwyrx7jBj2/Os9RyG6rJd0Jx1jmuUmfDF0iRWMsSx
         GGHZMBMK+/pSyum3/OIw7jITijOb7EmtXla2i+mOoKmVeN0xDWOcWxgUs4XZeoMZxJJu
         dYpY5m8UjRBt+303Ch9qYOSmoE7OBDqvP4jwLaY/2VVcfCpiiEuBwtQdM6+CTYSkdz9U
         IBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712258472; x=1712863272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dl/FopeODNdULB5NSwrsajN91zng/VnqM090COn1yWc=;
        b=vwiK/p24oUkdFZa0Y5b8ZOCLiVUeU+WUihjl3CcpuWQTRXVfmrjsCOHRtmHVmjvlL8
         cA4xFN/giSvzUU/LxhsXv3/QWV11Z+LawFi/iesYOOZ98Y0qJ1UMKcYj4D4seTRfW6CV
         vHQRp3JF8wJcO0qOtqChWsD6i6/VsCaw4fKXoZMsrQTUzxC+b8bR7vy7dyQ/aTvMR/f5
         1zcnqUKEJluKeMR/IF6RiUdBJHTOwbVNd4/bAqgywgY7OkNjvpo2FwWgQCgrDr7ohnlq
         Dg8etx5hmvQOG9zo+fs6LzQ3rqm1QCdEgCL+PmfiQvGuBY9hzBsd9cij3DFoi/NVO8eT
         Yz/w==
X-Forwarded-Encrypted: i=1; AJvYcCVy1ksk9X8ltPLRV0duKvi05RP+1UDkZNXPZ6X00ZWR6KuSuA79wDnpIKIs1hLZoZtd9rELFnV4gnVgNhmCHMn44TOGkLmN+GruH50bbqr1
X-Gm-Message-State: AOJu0YzvSEPa4hwJemKFv0JW6oI8wDxmtpEaZ9UAYxLH5QFCeLm6Vghv
	qOmqlXnyXIIuWHjF4dCyvs+9U/+z4J+1JRWDEkTOyPhPaFCF+TPwlXyaHQmB/kcNvLuBB8pk1Vy
	vIHQTBGwWpVG02OGXt8QZt27v+oM2Zj18nKku9Q==
X-Google-Smtp-Source: AGHT+IGyZ3JMNrz8F2bkpirKnyuGQawxZoeXVCC/y6GzZBE4nmRVGOFkLbxGUyQaEHSmHXKt9NtfMMywjFKnI39zfuA=
X-Received: by 2002:a0d:dd8c:0:b0:615:e10:691c with SMTP id
 g134-20020a0ddd8c000000b006150e10691cmr414269ywe.1.1712258471733; Thu, 04 Apr
 2024 12:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240403234054.2020347-1-debug@rivosinc.com> <20240403234054.2020347-9-debug@rivosinc.com>
 <8fb37319-288c-4f77-9cd7-92f17bb567ee@redhat.com> <d3689521-58a7-47df-bd6a-0e2e60464491@sirena.org.uk>
 <604863a6-0387-4f29-9c4e-5ef86a8ca904@redhat.com>
In-Reply-To: <604863a6-0387-4f29-9c4e-5ef86a8ca904@redhat.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 4 Apr 2024 12:21:00 -0700
Message-ID: <CAKC1njRT0GHJEY2NYWuPm7Az7yCj0ZWSevYj1NY6npr136jfsA@mail.gmail.com>
Subject: Re: [PATCH v3 08/29] mm: Define VM_SHADOW_STACK for RISC-V
To: David Hildenbrand <david@redhat.com>
Cc: Mark Brown <broonie@kernel.org>, paul.walmsley@sifive.com, 
	rick.p.edgecombe@intel.com, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com, 
	keescook@chromium.org, ajones@ventanamicro.com, conor.dooley@microchip.com, 
	cleger@rivosinc.com, atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, corbet@lwn.net, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com, akpm@linux-foundation.org, 
	arnd@arndb.de, ebiederm@xmission.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	lstoakes@gmail.com, shuah@kernel.org, brauner@kernel.org, 
	andy.chiu@sifive.com, jerry.shih@sifive.com, hankuan.chen@sifive.com, 
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com, 
	charlie@rivosinc.com, apatel@ventanamicro.com, mchitale@ventanamicro.com, 
	dbarboza@ventanamicro.com, sameo@rivosinc.com, shikemeng@huaweicloud.com, 
	willy@infradead.org, vincent.chen@sifive.com, guoren@kernel.org, 
	samitolvanen@google.com, songshuaishuai@tinylab.org, gerg@kernel.org, 
	heiko@sntech.de, bhe@redhat.com, jeeheng.sia@starfivetech.com, 
	cyy@cyyself.name, maskray@google.com, ancientmodern4@gmail.com, 
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com, bgray@linux.ibm.com, 
	mpe@ellerman.id.au, baruch@tkos.co.il, alx@kernel.org, 
	catalin.marinas@arm.com, revest@chromium.org, josh@joshtriplett.org, 
	shr@devkernel.io, deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org, 
	jhubbard@nvidia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_202115_733516_07D60BFB 
X-CRM114-Status: GOOD (  12.05  )
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

T24gVGh1LCBBcHIgNCwgMjAyNCBhdCAxMjoxNeKAr1BNIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZp
ZEByZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIDA0LjA0LjI0IDIxOjA0LCBNYXJrIEJyb3duIHdy
b3RlOgo+ID4gT24gVGh1LCBBcHIgMDQsIDIwMjQgYXQgMDg6NTg6MDZQTSArMDIwMCwgRGF2aWQg
SGlsZGVuYnJhbmQgd3JvdGU6Cj4gPgo+ID4+IG9yIGV2ZW4gaW50cm9kdWNlIHNvbWUgQVJDSF9I
QVNfU0hBRE9XX1NUQUNLIHNvIHdlIGNhbiByZW1vdmUgdGhlc2UKPiA+PiBhcmNoLXNwZWNpZmlj
IHRoaW5naWVzIGhlcmUuCj4gPgo+ID4gSXQgd291bGQgYmUgY29udmVuaWVudCBpZiB5b3UgY291
bGQgcHVsbCB0aGUgQVJDSF9IQVNfVVNFUl9TSEFET1dfU1RBQ0sKPiA+IHBhdGNoIG91dCBvZiBt
eSBjbG9uZTMgc2VyaWVzIHRvIGRvIHRoYXQ6Cj4gPgo+ID4gICAgIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDI0MDIwMy1jbG9uZTMtc2hhZG93LXN0YWNrLXY1LTMtMzIyYzY5NTk4ZTRi
QGtlcm5lbC5vcmcvCj4KPiBDcmF6eSwgSSBjb21wbGV0ZWx5IGZvcmdvdCBhYm91dCB0aGF0IG9u
ZS4gWWVzIQoKSSBtaXNzZWQgdGhhdC4gUm9nZXIuCldpbGwgZG8gdGhhdCBpbiB0aGUgbmV4dCBz
ZXJpZXMuClRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
