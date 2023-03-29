Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891F9C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 07:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nBXwryXOU8Pim83yfsmZCYkgt2kMyNQxCuGUof7vkpk=; b=QBSUkt32w/hrB3
	uQWZtN+FHegjGMN+HcEyncsZiwWeVnLKz5NtSX415MwkoeOhoAAdYyFRKBs4pUlvx2P+ikZcBZt/F
	vCdlftfeRraWOmoHO+Mu7YesbUiQEH3iyWNK+R99uqiNXK04vosSQKcfOSFolgBdL39kRJeRbo8+i
	Q/ONbltX2EAFrWc2HdE+hwpqLBHqhMUQ0CFqBHwDjtNHSP6PaQRyqZcdurDb7lSxzNGxcWr1KX7hd
	vd+oHQTX9q4knu8TC742OaOd1H7q87c+ImuJCCoDG9btra+qBSYpe12FrihkySW+2mO3ETnFUpuC7
	6QOjIV9Ba5EkPOkanxNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phQLR-00GwBp-26;
	Wed, 29 Mar 2023 07:35:45 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phQLO-00GwAZ-1Q
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 07:35:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so5514089wmq.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Mar 2023 00:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1680075338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tb//YDVUmszU3HNKDs7zRNHGdvp2WswWGNo1xYLl49k=;
        b=btxz4X7mi144ytdCdyjcDvmeXuljdwVW3fU5zn5YfnfuTrHFrI+p6APnH4mRMnN7SC
         8gctq+qrbaNiJ0PhVwg+SGjTLLeZ1tZDUUAso30YkbYvhEJO8GDJdQdf/Y3Z0fO947vX
         6UXc9gLGoAeiF556Aiom0/yK5s+mW6aL1mfOqzrhart9Qbk+Ku/0lQUBviTA7uDz6P5C
         nkgd0KYXSGFDea2fvcqaL9yReEXgZ5xLBzawZeejqbD0FRITVhrUcRFym+V5CSjteEtU
         Ycom5LOgeyf1toe6pAEVEgbI0JvJOUgvwkjZFzBkIhMcA7JqYHaAIl2bg/OtG2hsf/Fu
         fRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680075338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tb//YDVUmszU3HNKDs7zRNHGdvp2WswWGNo1xYLl49k=;
        b=nt+EepIonMLh1ApPgKg1FdShIFvMf0yCA0Ye03eUP5HmiZciRMaSYnZjdTKDYioLqA
         8fec70RxgI1HFrWTYD27ndf99IkWdl2jK7sgX2FFnkrdt3zETHHMlYWNdz5dGVQKVV+2
         KDRyzJOcmiz3CVooaPoNCV5j7HK+n26P2vv/C4GsZuIxdW8Ob057JyPGPZiWQeiGDkEC
         m/3V1KUwmDKlU+937yi9XY0QRnaOS4zHl6nckr/lA29kIA2C1OwoOc+FvmvhUgCOTenL
         NnYrwRE8wp2Nxqa5WTys69hbXi28CTdotoo+/Z3cFVBVhqOrc7kLqc1pnLGTSK/x+FQ0
         aClQ==
X-Gm-Message-State: AAQBX9cIrbYdS/1bCOpnZGRt3Xg+OU4j+9Fi1tJRjAWBb0sLnSOdKj/0
	TYimL/MQ9ZkX0F/m20RthsXXLjwa7gkibKnGCCi+Og==
X-Google-Smtp-Source: AKy350a+DVwXzR1171GYdtWnoFYic/UYA525fZ5ISoocG8RHpGIl1lm1Y4OfeO/xsnQVh7981UqLgddYWPJ3fUDjdJQ=
X-Received: by 2002:a7b:cb8c:0:b0:3ef:6dfc:916d with SMTP id
 m12-20020a7bcb8c000000b003ef6dfc916dmr2410999wmi.7.1680075337829; Wed, 29 Mar
 2023 00:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230327115642.1610-1-cuiyunhui@bytedance.com>
 <d7111158-7e17-4c88-a8c1-a568db5891fa@spud> <CAEEQ3wkKr9NhKwo0O3D=pfi80j7-cup3VgaWuk8vdk87=ryy6g@mail.gmail.com>
 <747a3382-17e7-4167-a1bb-30a9482be4d1@spud>
In-Reply-To: <747a3382-17e7-4167-a1bb-30a9482be4d1@spud>
From: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Date: Wed, 29 Mar 2023 15:35:26 +0800
Message-ID: <CAEEQ3wm4Ax4v63QVb7NtQp=-HxbKZNAUsQwevBzDs3sX4+pu9w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] riscv/fault: Dump user opcode bytes on
 fatal faults
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_003542_738209_B7476E2D 
X-CRM114-Status: GOOD (  11.21  )
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

SGkgQ29ub3IsCgpPbiBXZWQsIE1hciAyOSwgMjAyMyBhdCAyOjI14oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cgo+Cj4gUmlnaHQsIEknbSB0cnlp
bmcgdG8gZmlndXJlIG91dCBvZiB0aGlzIGlzIGFub3RoZXIgYnVnIGluIHRoZSBrZXJuZWwgLQo+
IGlmIHlvdSBkb24ndCBoYXZlICJmZCIgaW4gcmlzY3YsaXNhIGluIHlvdXIgZGV2aWNldHJlZSB0
aGVuLCBldmVuIGlmCj4gQ09ORklHX0ZQVSBpcyBzZXQsIG5vbmUgb2YgdGhlIEZQVSBjb2RlIGlz
IG1lYW50IHRvIHJ1biwgcmlnaHQ/Cgp5ZWFoLCBDT05GSUdfRlBVIGlzIHNldC4KSW4gdGhlIHBy
b2JsZW0gSSBlbmNvdW50ZXJlZCwgdGhlIGluaXQgdG8gYmUgZXhlY3V0ZWQgaW4gdXNlciBtb2Rl
CmNvbnRhaW5lZCBmbG9hdGluZy1wb2ludCBpbnN0cnVjdGlvbnMsIHdoaWNoIGNhdXNlZCBhbiBl
eGNlcHRpb24uCgoKPiBXaGF0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBpcyB3aGF0IHRoZSBuZXcg
c2hvd19vcGNvZGVzKCkgZnVuY3Rpb24gd2lsbAo+IGxvb2sgbGlrZSA7KQoKQWZ0ZXIgcHJpbnRp
bmcgdGhlIGNvbnRlbnRzIG9mIF9fc2hvd19yZWdzKCksIHRoaXMgbGluZSB3aWxsIGNvbnRpbnVl
CnRvIGJlIHByaW50ZWQ6Ck9wY29kZTogNTMgODAgMDIgZjAKCkl0IGlzIG5vdCBqdXN0IHRoZSBw
cm9ibGVtIEkgZW5jb3VudGVyZWQuIFdoZW4gdGhlIHByb2Nlc3MgZXhpdHMKdW5leHBlY3RlZCwg
d2UgYWxsIHdhbnQgdG8ga25vdyB3aGF0IHRoZSBpbnN0cnVjdGlvbiB0aGF0IGNhdXNlZCB0aGUK
cHJvY2VzcyBleGNlcHRpb24gaXMuCgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
