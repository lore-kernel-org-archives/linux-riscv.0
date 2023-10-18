Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6D5CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 17:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sglj90sLlZgNHcpv3a/cdsO/HDp61QIOircIF+85qSw=; b=jbNT4pg9QaxYHV
	Bx3Qrbh/RlFWkenrCBOik64PhAgna80ae00ZIN3pOUeN1tcvjRgDHUbHX5FthAzh4Z/AzpXLMkEij
	8SYZDtaTDJEKJYnVnpY1NFdTz4lEnZl6SL14jpF7jRKKVyIbgJ4zgQycXnJIPcuHLBPr88c3Mnvq/
	XoUhwqDDK1vZ3C78unD2mrCHAILgLbEWj8HMaqD7DyocgBtlbR7b8JI8wCc46TianXDDrv02Bwm8w
	nLpat1TVpVazC4x6GTY4rS1dUMr/JPPGsWnvR0oy9Enjq2zsAPMWECqjRIKsp9WLZHR6NhDecqSXM
	ksPZmgwiDmvcyFLLa2lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAHx-00FIqA-2m;
	Wed, 18 Oct 2023 17:24:57 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAHu-00FIpE-1v
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 17:24:56 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c54c8934abso6691431fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 10:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697649892; x=1698254692; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGr+wt8mibKQk7V/xmPHf9oID5HtJ6aKoUQCNWyJYkI=;
        b=zhN41hiadN3doq9uqGmOCXV2ZZJoDw6Caz0ZrWqlY8FeSmdUVGD3r2HTSLwgFhX/4Y
         drCygecoi7u6JcpknyuGyS+xRn7Xu8S+j1rQa9qYtkUlK/OMWQLJcVonQzfDVM0wzzLT
         I+gd9uO7n6/uHkFU9Xl93TJDqm2KMchxSNkOc88R1NcH3FpHsBhddue+JI1Ttrr1HMCR
         VZe17IlzT7mq6fhrT8JQn4in0BtxoFURmhhEnVCcTHqxjvN8/rU3lLSOqdVj0iskpQsK
         PQjGAlJgNZD0kio2zvdntxwMQlJ0nVyJ/PvXvKeP2SBCgH8VLddG0Q2jG9lha4l8QKs+
         9/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697649892; x=1698254692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGr+wt8mibKQk7V/xmPHf9oID5HtJ6aKoUQCNWyJYkI=;
        b=Kk8uh0+s2Ybwfg5CCda0BY1ACSsIopcxEJgFszigHEPqdNvRQIkEf4v7IMAq69HbNz
         TgF1Nm/EUrBMcebQWhiTxk3IM0EfK9SrqB/3LlfD0BHSmNyx9bI5VdadAKEfqC3btPLX
         W3O5JG4GUgorTLHkufz/sZy4FINnBaz+WeVVQPOxwhF5Txc6pXQlo/Rxtu5BJqO0S7fW
         OdhY9rk2WorijCYSj1YJ/2v4H5E0IbuVAe9bEDslmMPe448TepattqbJVuslwB13rPGc
         Q+DiLIXwOQAuGk7xeg76MGBVkJ2e6wAwEMRrU4BSBG/vbOTdtKlOYx13MFERRuo8MhrO
         WIaQ==
X-Gm-Message-State: AOJu0YxHPsbDQ8tVvhd9+emrgUNSDfuxX+IVV/RcH9UtcmsczOFOkq+X
	4yStH47Unifwd3WsvKMsgO43QQjsmT+4//Htv+Epyw==
X-Google-Smtp-Source: AGHT+IHn5JoyDBx4hQ6moyifBlTpJE2HspdWaEwiTdR7052+Lklyunc7KFWvmABqPETQ6/Rlz2A1G6dGqOcAJlNQXXc=
X-Received: by 2002:a2e:9b13:0:b0:2c5:3492:5d96 with SMTP id
 u19-20020a2e9b13000000b002c534925d96mr4576190lji.12.1697649891740; Wed, 18
 Oct 2023 10:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-2-cleger@rivosinc.com>
In-Reply-To: <20231017131456.2053396-2-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:24:15 -0700
Message-ID: <CALs-HssL=wNwj9nRuZwpZhy1CB9p9-X=OqgwBw9zvgA7hA4fEg@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] riscv: hwprobe: factorize hwprobe ISA extension reporting
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_102454_635123_200E690F 
X-CRM114-Status: GOOD (  17.13  )
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

T24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgNjoxNeKAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBGYWN0b3JpemUgSVNBIGV4dGVuc2lvbiByZXBvcnRp
bmcgYnkgdXNpbmcgYSBtYWNybyByYXRoZXIgdGhhbgo+IGNvcHkvcGFzdGluZyBleHRlbnNpb24g
bmFtZXMuIFRoaXMgd2lsbCBhbGxvdyBhZGRpbmcgbmV3IGV4dGVuc2lvbnMgbW9yZQo+IGVhc2ls
eS4KPgo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNv
bT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMgfCAzMiArKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygr
KSwgMTQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lz
X3Jpc2N2LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwo+IGluZGV4IDQ3MzE1OWI1
ZjMwMy4uZTIwNzg3NGU2ODZlIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19y
aXNjdi5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKPiBAQCAtMTQ1LDIw
ICsxNDUsMjQgQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdw
cm9iZSAqcGFpciwKPiAgICAgICAgIGZvcl9lYWNoX2NwdShjcHUsIGNwdXMpIHsKPiAgICAgICAg
ICAgICAgICAgc3RydWN0IHJpc2N2X2lzYWluZm8gKmlzYWluZm8gPSAmaGFydF9pc2FbY3B1XTsK
Pgo+IC0gICAgICAgICAgICAgICBpZiAocmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoaXNh
aW5mby0+aXNhLCBaQkEpKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHBhaXItPnZhbHVlIHw9
IFJJU0NWX0hXUFJPQkVfRVhUX1pCQTsKPiAtICAgICAgICAgICAgICAgZWxzZQo+IC0gICAgICAg
ICAgICAgICAgICAgICAgIG1pc3NpbmcgfD0gUklTQ1ZfSFdQUk9CRV9FWFRfWkJBOwo+IC0KPiAt
ICAgICAgICAgICAgICAgaWYgKHJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYWluZm8t
PmlzYSwgWkJCKSkKPiAtICAgICAgICAgICAgICAgICAgICAgICBwYWlyLT52YWx1ZSB8PSBSSVND
Vl9IV1BST0JFX0VYVF9aQkI7Cj4gLSAgICAgICAgICAgICAgIGVsc2UKPiAtICAgICAgICAgICAg
ICAgICAgICAgICBtaXNzaW5nIHw9IFJJU0NWX0hXUFJPQkVfRVhUX1pCQjsKPiAtCj4gLSAgICAg
ICAgICAgICAgIGlmIChyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FpbmZvLT5pc2Es
IFpCUykpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgcGFpci0+dmFsdWUgfD0gUklTQ1ZfSFdQ
Uk9CRV9FWFRfWkJTOwo+IC0gICAgICAgICAgICAgICBlbHNlCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgbWlzc2luZyB8PSBSSVNDVl9IV1BST0JFX0VYVF9aQlM7Cj4gKyNkZWZpbmUgQ0hFQ0tf
SVNBX0VYVChfX2V4dCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gKyAgICAgICAgICAgICAgIGRvIHsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKHJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYWluZm8tPmlzYSwgX19l
eHQpKSBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWlyLT52YWx1ZSB8PSBS
SVNDVl9IV1BST0JFX0VYVF8jI19fZXh0OyAgICAgICBcCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgZWxzZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtaXNzaW5nIHw9IFJJU0NWX0hX
UFJPQkVfRVhUXyMjX19leHQ7ICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgIH0gd2hpbGUg
KGZhbHNlKQo+ICsKPiArICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICAgICogT25s
eSB1c2UgQ0hFQ0tfSVNBX0VYVCgpIGZvciBleHRlbnNpb25zIHdoaWNoIGNhbiBiZSBleHBvc2Vk
Cj4gKyAgICAgICAgICAgICAgICAqIHRvIHVzZXJzcGFjZSwgcmVnYXJkbGVzcyBvZiB0aGUga2Vy
bmVsJ3MgY29uZmlndXJhdGlvbiwgYXMgbm8KPiArICAgICAgICAgICAgICAgICogb3RoZXIgY2hl
Y2tzLCBiZXNpZGVzIHByZXNlbmNlIGluIHRoZSBoYXJ0X2lzYSBiaXRtYXAsIGFyZQo+ICsgICAg
ICAgICAgICAgICAgKiBtYWRlLgoKVGhpcyBjb21tZW50IGFsbHVkZXMgdG8gYSBkYW5nZXJvdXMg
dHJhcCwgYnV0IEknbSBoYXZpbmcgdHJvdWJsZQp1bmRlcnN0YW5kaW5nIHdoYXQgaXQgaXMuIFBl
cmhhcHMgc29tZSByZXdvcmRpbmcgdG8gbW9yZSBleHBsaWNpdGx5CnN0YXRlIHRoZSBkYW5nZXIg
d291bGQgYmUgYXBwcm9wcmlhdGUuIE90aGVyIHRoYW4gdGhhdDoKClJldmlld2VkLWJ5OiBFdmFu
IEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
