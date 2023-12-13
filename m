Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E2DC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 17:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2u3fHJpXJSKUaTMh9EC6E+k5nKo8mdq2yvD0tHz+XoE=; b=30XBWA5TklDC/a
	dPS/GJBMCCf9oGmnshxNvDbq43U0rDQythar/Nw4N4Muv67bRi0pbkvWEnGFc0pkndDsGQjA1OeI3
	My9icnTmIz6IUaubQGtB7wbzPZvnORykjbT05IcSp/lAi1NiaGhxYHhM0n6lTJisIthpYJbisKDeU
	GfgB0U9ITiMySZhc6JU11FRsMRwVp3ystmcymFoHcJfWDpECQ/ae2QzO6p8Bz3NchkJJM7SBtV9sJ
	1i43mEx3wWq9lOS7h0Ijy5ffFPBzGG7L+nZwRgotBLjk33brpRjsR49JEA/i7EobHKT5rTB3ngq4k
	LER9wxGNxAmO0l6z1nYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSyF-00FaaR-0V;
	Wed, 13 Dec 2023 17:24:31 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSyB-00FaXL-2d
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 17:24:29 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2887c3b6581so5338446a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 09:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702488265; x=1703093065; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcs8UcaVH3cN3KJhf0EMdMZA59cC/HDX2ceGrDOds54=;
        b=l48SsqzOnSlH1tbE03HweH+LF0iMCNa1b9MIH5z9AOqkDH1FIZIRE5Ov05QW5jRE7M
         2tSrgVotKk3hufBMNzBdZtB94rsXjJfiVU++rY8pjKWNv1PocS5pDiTxltLq8QYz3dc4
         Kwa7Tv+R6qNN2rk+CGBOX6cuP5N/8gq3MchyMao6SrYd4rZ14lAryIJ1RbijoszkS7m5
         OWRBogTA1zspEU0mJgit8e80JIXIEEruz17XV3rn8f3nAnPtL/ox94vvvGdYDs+/QAVS
         4IzsR8NlQGpqN2xZn1KxMGayUqjX+GvB55DfcsYSY+rnXQ7FveMxcpXpCR9dcou3pQip
         R13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702488265; x=1703093065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcs8UcaVH3cN3KJhf0EMdMZA59cC/HDX2ceGrDOds54=;
        b=Zvs21tcfapn2j/Qq83JbR0XnRmRC0ExCYMkMyirPE1o/9+GHWCU2BX+rCwOj/f1J17
         wwhxNuhw/2gcLvh7jP00psz5AHb7R/mJw24rZFiXpzQ/JwX/pAmJz3OAi090bGktSGYc
         HGfQOWwtNswps+bza35a4q+8v2cUG1HJRS97p6/wbsK7WESeffAHZePDrrlWfRFg3D4M
         5acSpTETHOVhpsooWrYePnngT9Np5gTNHksh3UBG32je4uV1YjR6xzt9oHAxhv8tAyQ3
         eHQS9Mw6nTstjspwreqvX/kcfhNsNEBJO3DzRowLj6Q5W/EchXrg5Gg/6gMs2bryql15
         QpFQ==
X-Gm-Message-State: AOJu0YwBBIdoge+stqgeICs39ssHZRupAhL0n85jdmCHmuZV88h+PcS2
	6/sdUEL9lIGzi9lMVGoDs5Z5yNGIil8CUVCC4vQPtA==
X-Google-Smtp-Source: AGHT+IEnz614ZfPuJyspElqvUuRydqyaQJltk1wk8ne6cxYLQy4lD9i3zxsn1BbtZYsV0ot+PyrwE/WHJm3VHEaAWYg=
X-Received: by 2002:a17:90a:5146:b0:286:a1be:c4e with SMTP id
 k6-20020a17090a514600b00286a1be0c4emr4185003pjm.9.1702488265275; Wed, 13 Dec
 2023 09:24:25 -0800 (PST)
MIME-Version: 1.0
References: <20231213170951.93453-8-ajones@ventanamicro.com> <20231213170951.93453-10-ajones@ventanamicro.com>
In-Reply-To: <20231213170951.93453-10-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 Dec 2023 22:54:13 +0530
Message-ID: <CAAhSdy1ch3gVvDvCPPtuS0Y2MQcmstV1a26TBCd2vNVHAoGkAw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] KVM: riscv: selftests: Drop SBI multi registers
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	atishp@atishpatra.org, palmer@dabbelt.com, haibo1.xu@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_092427_852490_B92DC6B5 
X-CRM114-Status: GOOD (  12.79  )
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

T24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgMTA6MznigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoZXNlIHJlZ2lzdGVycyBhcmUgbm8gbG9uZ2Vy
IGdldHRpbmcgYWRkZWQgdG8gZ2V0LXJlZy1saXN0Lgo+IFdlIGtlZXAgc2JpX2V4dF9tdWx0aV9p
ZF90b19zdHIoKSBmb3IgcHJpbnRpbmcsIGV2ZW4gdGhvdWdoCj4gd2UgZG9uJ3QgZXhwZWN0IGl0
IHRvIG5vcm1hbGx5IGJlIHVzZWQsIGJlY2F1c2UgaXQgbWF5IGJlCj4gdXNlZnVsIGZvciBkZWJ1
Zy4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5j
b20+CgpMb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICB0b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgfCAyIC0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNj
di9nZXQtcmVnLWxpc3QuYwo+IGluZGV4IDVkODZjNzYxNzg0ZS4uMjdkMDdhMzJhMWVmIDEwMDY0
NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3Qu
Ywo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3Qu
Ywo+IEBAIC01NzEsOCArNTcxLDYgQEAgc3RhdGljIF9fdTY0IGJhc2VfcmVnc1tdID0gewo+ICAg
ICAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VTE9ORyB8IEtWTV9SRUdfUklTQ1Zf
U0JJX0VYVCB8IEtWTV9SRUdfUklTQ1ZfU0JJX1NJTkdMRSB8IEtWTV9SSVNDVl9TQklfRVhUX0VY
UEVSSU1FTlRBTCwKPiAgICAgICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVUxPTkcg
fCBLVk1fUkVHX1JJU0NWX1NCSV9FWFQgfCBLVk1fUkVHX1JJU0NWX1NCSV9TSU5HTEUgfCBLVk1f
UklTQ1ZfU0JJX0VYVF9WRU5ET1IsCj4gICAgICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19T
SVpFX1VMT05HIHwgS1ZNX1JFR19SSVNDVl9TQklfRVhUIHwgS1ZNX1JFR19SSVNDVl9TQklfU0lO
R0xFIHwgS1ZNX1JJU0NWX1NCSV9FWFRfREJDTiwKPiAtICAgICAgIEtWTV9SRUdfUklTQ1YgfCBL
Vk1fUkVHX1NJWkVfVUxPTkcgfCBLVk1fUkVHX1JJU0NWX1NCSV9FWFQgfCBLVk1fUkVHX1JJU0NW
X1NCSV9NVUxUSV9FTiB8IDAsCj4gLSAgICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpF
X1VMT05HIHwgS1ZNX1JFR19SSVNDVl9TQklfRVhUIHwgS1ZNX1JFR19SSVNDVl9TQklfTVVMVElf
RElTIHwgMCwKPiAgfTsKPgo+ICAvKgo+IC0tCj4gMi40My4wCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
