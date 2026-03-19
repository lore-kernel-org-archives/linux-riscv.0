Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFB81090233
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 14:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/rDAaqWpNqsCZWGwHK41OyCdGU/d3bi6W3qyga/uyo=; b=pUNbPjvRHkRgqb
	I4Wrmg8pobvQanxPSAK+mlpdsOBthBbCH+t6pKnjMaHNYcKgCqLrxHRDGUMiVzEVvYWGERJbEEzFa
	D0PdBGc0AWpc8lNkKL7etmMesAXfqeJohEsi/XDSLZMrhVDVKD3ag4kcjPqARDukCsGMoBc6zLWi0
	QxdJllUwLSY1/AIw0FMZqM1xmen0/pHi95xedQYoi2tI+PxZjoJyqUPDmtZ1xZWs1PqQWGt7YSY7P
	7R+ZIQWNBGD8oPf81uCOYOB7464Q5JwfiJbZb0dHNw+ivwh9fDfEeQxLmoHVrm9mLJr8nvcJ6LnGg
	PkYq63HHGPQv9xDziKtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EM0-0000000AniZ-2cgY;
	Thu, 19 Mar 2026 14:28:04 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ELx-0000000AnhS-27mC
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 14:28:02 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b8d7f22d405so148769866b.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Mar 2026 07:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773930479; cv=none;
        d=google.com; s=arc-20240605;
        b=Bd9oeHmFpop+hIEPjZBUqCoPV+ODPkQO3h01PtaSQDdw4ZCq87PRq1TVHk5qv3B7np
         DUIKZ+/9pnGoZiZaMLKEFlQ+GDtsBZqc323puLup+pZmCCqnwaHAUHFsVKaM0cMMrnx6
         YdPDvTyCc07hU9/zlnAOxGnI6nKAziBx6OQkNPCOVmQaQR+LvDVwts6xpfP3K8WrYuuZ
         TRTaJbmM6TVgviyuTuXOH4VRVV+ctl6XbiW0WwNyXiEsI8SMP4dUrzh80zYdS5gK2738
         7CTB3r/7nxwOHfFGZ4gHxWVCKo0l56RuODOGLJO1tgK+4t+3C72NmuDP9WPsf0dKmoWj
         9sTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wEYdsi/UQnV1ulkUEVFM3uerucLpRLXH0M0xgNStZdI=;
        fh=tszxfOJ9LMNtuJmeTC0lzWBpRhiIl/nPGvO75Kxb6Qo=;
        b=RBcGPEm5prPiyCxoOz4sI9FK8klmpsfqL57oIoUrMEtwtV37CpajacBHgVx9eVs1MI
         iPwPmADhUmHFDy6XYXViiT1ijFUXyrbtmVzDZh5PdlD0SPTh5a9pmrYqt+JNNDQRF7/9
         R5m8zzrHiF2UaNEMG54qBNsbitvHobleoef7Y45o3a1gpSBm1NGY4FpU9agjKlmYq7EV
         sKpAp+12EAhJsGJj10RveFK1HbWDqd02EDXZeXm7N5NvM/IRLhPxrSUM1fEKp2SyfuTV
         qujKh37LxVkURtxzLWzx+gwOnBNb1wsWBA9QSmRn45HeqlReOzK6COcqNsbLhEijr7Xp
         TBog==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773930479; x=1774535279; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEYdsi/UQnV1ulkUEVFM3uerucLpRLXH0M0xgNStZdI=;
        b=TFDjXDupJEBSkW2eDiK9/4IcCmEJ3j1qPAUZv5FhsUa/Ts1zkRVM00UcPje0V8YUYb
         0usQYJMs+kmhbsJGp1Q+Hlx2DrCHhvNyUqMnzFZpELjgMEmlcj/pmVJyi4bavk0BhvjM
         dKLARtxS4vvvWtokKR5X9twLXZOUBCybxQXqcMt+prTyeufY4NWQNU63LPMm4lwiWf/s
         tsWTFMK9d4f2VyDGI2nJVYNHTVKmZG25hnZWHbJXArC9zHZujXig4WKQ62xF9IExO3ag
         MCJJgpNSBwEiJjG1qstKinM1DqqBlQo8S7GcEBoKe3EfNJoeUV+lwb9Zd3NDSH+mITsf
         ZOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930479; x=1774535279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEYdsi/UQnV1ulkUEVFM3uerucLpRLXH0M0xgNStZdI=;
        b=Ilw0TkRnX7XxJWub1k/Qtisu4onLa7SJvCp4YG9qaz48rsXTxhZ54tq2At3FOYmzxt
         3FIdf/31jN3gfWWPSjgNq1y5klW3sDLQc7HfhMNc3Igk3fCEIfatMsJOKdtX/BqH6iSf
         TjjOk+7onIEgR3GOWd7UQHDw/0w3Mu7j2Q6EXGPcpPInTyJASR/b6Ge6gIhLzPkjZP80
         Ocd8Cu/m8Lqr7R1weeUeCaM3qUxIHxeZTWR7aAfuntj2bIyd2+xZPmZSNqPSiFJMcxeH
         tJto1OJjg6trRjR13p+Sdu7tB+Zy8zbgwjKJuuW3TOaN81/yBq0qmiDW7jJAp25hQI3U
         pxpg==
X-Forwarded-Encrypted: i=1; AJvYcCUARRB7SOVmpme9iq3vWVRQM7wYYhPu6iW7Jc4xVm96vve+znjoDTRisj0raXNhaHZS3tfUlIp24bOdUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxG2jtTa0lwKibfBXRe9UzpXSbJv50u7mAujZHv8EiYbtEnETzr
	4shKJVttEgfdsblJmS8JKPyuW/aNQ3TGXjEH0tDVe0rhcTAZx6aBuiIgGSBrtr6toNLTlbiq9hj
	ZjdDOsV8wEE2NwzIMvpUDWf3G+5HY/5Y=
X-Gm-Gg: ATEYQzx7+zj8oT3FhyIwvchV/ul+uZJBGxtd/RQQb35oFMA8Ionng4fQnFy7UY47oK+
	2YQ7W4t13nhENz3/SqoGHEm4Vz8hW9ANY4LsD9synnKUZNDPBC0g6ZGMEoR/AgYW8FWni4Nbig4
	QV8jN5Nhe0/0RIAwPZYPSZo7gG5TOGHigDtdxeSUKcyi7EhFxDj4u3pyJmp4hUAj3TyWKUDH4EB
	CfN18+u+SctaR997Ccq8/8uS0xdssEeXIEqqRJLk8vcJTYnjeFqLTo9wQEpUms2yZV7vSMMQ1fF
	pkhrMM42tA==
X-Received: by 2002:a17:906:ee83:b0:b96:db93:5d0e with SMTP id
 a640c23a62f3a-b97f4ab7799mr545864466b.41.1773930478856; Thu, 19 Mar 2026
 07:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de> <20260302-at-vector-size-arch-v1-7-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-7-a11f03ba2ca8@linutronix.de>
From: Andy Chiu <andybnac@gmail.com>
Date: Thu, 19 Mar 2026 09:27:47 -0500
X-Gm-Features: AaiRm52wQD6uRKulnt1Y_ioaRFL-b1bqEKDLHZMA0LYwV13CAWHAV79Bf5laR-o
Message-ID: <CAFTtA3O74BTJz8d87CJFQpa8Sub_ouKyyAB8cTXUxd=BnUzS7Q@mail.gmail.com>
Subject: Re: [PATCH 07/15] RISC-V: Remove AT_VECTOR_SIZE_ARCH from UAPI
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-alpha@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_072801_556051_A6D75AA9 
X-CRM114-Status: GOOD (  20.33  )
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

T24gTW9uLCBNYXIgMiwgMjAyNiBhdCA2OjI34oCvQU0gVGhvbWFzIFdlacOfc2NodWgKPHRob21h
cy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+IHdyb3RlOgo+Cj4gVGhlcmUgaXMgbm90aGluZyB1
c2Vyc3BhY2UgY2FuIGRvIHdpdGggdGhpcyB2YWx1ZS4gSW4gdGhlIGtlcm5lbCBpcwo+IGFsd2F5
cyBjb21iaW5lZCB3aXRoIEFUX1ZFQ1RPUl9TSVpFX0JBU0UsIHdoaWNoIGlzIG5vdCBleHBvc2Vk
IHRvCj4gdXNlcnNwYWNlIGFuZCBhbHNvIGNoYW5nZXMgZnJvbSB0aW1lIHRvIHRpbWUuCj4KPiBN
b3ZlIHRoZSBzeW1ib2wgdG8gYSBrZXJuZWwtaW50ZXJuYWwgaGVhZGVyLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+
CgpSZXZpZXdlZC1ieTogQW5keSBDaGl1IDxhbmR5Ym5hY0BnbWFpbC5jb20+Cgo+IC0tLQo+ICBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2F1eHZlYy5oICAgICAgfCAxMyArKysrKysrKysrKysrCj4g
IGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCB8ICAyIC0tCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2F1eHZlYy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9hdXh2ZWMuaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5m
YjQyMzM0NDUyNzYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9hdXh2ZWMuaAo+IEBAIC0wLDAgKzEsMTMgQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAtb25seSAqLwo+ICsvKgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTIgQVJNIEx0
ZC4KPiArICogQ29weXJpZ2h0IChDKSAyMDE1IFJlZ2VudHMgb2YgdGhlIFVuaXZlcnNpdHkgb2Yg
Q2FsaWZvcm5pYQo+ICsgKi8KPiArCj4gKyNpZm5kZWYgX0FTTV9SSVNDVl9BVVhWRUNfSAo+ICsj
ZGVmaW5lIF9BU01fUklTQ1ZfQVVYVkVDX0gKPiArCj4gKy8qIGVudHJpZXMgaW4gQVJDSF9ETElO
Rk8gKi8KPiArI2RlZmluZSBBVF9WRUNUT1JfU0laRV9BUkNIICAgIDEwCj4gKwo+ICsjZW5kaWYg
LyogX1VBUElfQVNNX1JJU0NWX0FVWFZFQ19IICovCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9h
dXh2ZWMuaAo+IGluZGV4IDk1MDUwZWJlOWFkMC4uMGE3MjVmMmFhMmU3IDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaAo+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaAo+IEBAIC0zMyw4ICszMyw2IEBACj4gICNkZWZpbmUg
QVRfTDNfQ0FDSEVTSVpFICAgICAgICAgICAgICAgIDQ2Cj4gICNkZWZpbmUgQVRfTDNfQ0FDSEVH
RU9NRVRSWSAgICA0Nwo+Cj4gLS8qIGVudHJpZXMgaW4gQVJDSF9ETElORk8gKi8KPiAtI2RlZmlu
ZSBBVF9WRUNUT1JfU0laRV9BUkNIICAgIDEwCj4gICNkZWZpbmUgQVRfTUlOU0lHU1RLU1ogICAg
ICAgICA1MQo+Cj4gICNlbmRpZiAvKiBfVUFQSV9BU01fUklTQ1ZfQVVYVkVDX0ggKi8KPgo+IC0t
Cj4gMi41My4wCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
