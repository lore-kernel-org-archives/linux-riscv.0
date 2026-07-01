Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7C3C43327
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 01:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+b9+59uPQYKrFvqhJc5UWSc7/m2iYanFvFmKN2dO2E=; b=DCLZ4ejrEdYY1K
	M2PYAutf5KupWPZAohknWms/Qfxi/tXUKZ5LgGTG3sRnBtEUn3/+xmbGPl/0hCRsFjypL2+hQnxax
	ro9rsTUgy5wKz4ujXnVvDK+VNBlKTujgRrR/V0CcydtOeLIs6iTaYkRfx/vWNh7X4VrFqCRO0J+Wp
	QMNVIkQBZwXpFZIIfpfcFPKyJc6Bou9XbwiC708b0g8Nr+etUmwAlrTyrod4XcYAs3PL9+8CZ7eL7
	IHWGryaFOTYlu22t5n8GvnkRVAj6GWIX/Y327iHXpBYdnNw++aFbzKUu5ZxYq5wjlkmg4ZrhwFIQK
	ZrIwW3FoxHnU5sALNl5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weja7-00000000RXO-0Dz1;
	Wed, 01 Jul 2026 01:17:39 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weja4-00000000RWe-1eGs
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 01:17:37 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-139b914bab6so102630c88.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 18:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782868655; x=1783473455; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EtMWeNmrDijSuvzYdFzBzIe5+kn8Pd5DLzMwnJd/LPU=;
        b=siVmHafPoSIoVf8c9zkOHmovw+TrG0NHXwI7+b6Lc/knrDg7zHyVluXEWu+hKAb3We
         04JnZnFHv6nUVNZnQC6F8Ij+DJrncstQVFUpHBh0pVJ6zWkROEs1UtJWRmqtmvYOIQ1n
         7FhytnUlCz9HjTup9iIdsQF7JWEH2zn/AdvnbehE7gOKti+aUD7pioFcir/gAxGprDrb
         JQF9I54GH8WUcrInNEG55ek5ESw8RLazR/7ukf6lXtDjBQL3lVuj4ZGlym3hteLLdE/G
         0YFun+T28hcLdEZM8UrFciNRA381PiZNw9hvQBaNGPHMsAUJ+TlEfwCqNjTXcv3iJLHL
         aUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782868655; x=1783473455;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EtMWeNmrDijSuvzYdFzBzIe5+kn8Pd5DLzMwnJd/LPU=;
        b=SQIsah0QaZtPgQysV13YGf7SkiEgmgH/URiv+85jFtloM0SqKfwAniHQI5hzojCRUO
         QVsDb15KLceshqhfUzx4KHmrXA6GFrN8Hu5+MYdVnzZWJUDHkVA+6AN7RxBrq8ps475h
         ZoBiZxi55ZK189YMP47OUxH2awKbV6oUvOQaqnliibXPaJpzsAO7NQ08+SY/XoXpeDJ9
         sauwv8aodFpZmg/96ors+hoXthNKvvSMuk/CLwH0V/+HAf688w9rhYof4SDupMB8FQ+n
         JjMinIAUkD1ZQlTVU2Tdn78WrKWGreEzg13hJUTOaCZMIEiCkkj669+io0dAwNYtjRRK
         /i5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqnWdH90J8VpLvW2xiyu5/9PQ9PoCDcVhYp7JHKGdRLbiAHUfHs+n7DA0DEeU+B0VrbXQ+Cd9dwY+RGag==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfSF+EgpIZAYFzTTvRbwbFgl6zfgGlSRN7nYJJCRukxetQZtCF
	FfX/Si748s0IYw7VRcr5wsDg6bo+/CFj8uqbVtv51vP7DPhTGtjtqdUF+PQ6bUiv
X-Gm-Gg: AfdE7cmbD1d6dQwcEkLSbXjBgMShh5Lp/eEQJNFKG9a5VzB1AMJMFUpsKZOobZNIRzM
	OcqGeJFmZdekfCja39XFUCARF/iD6iehF4un9zqLMJ1lN1FHLseZ1cZvXI7nSEc4baOAZd5zmfJ
	YXtewox7qGZ5LTZiAaxDP2AUslLHTJQTEBDGRrWPQBuqfaKl6OJIRBOictjZKu9plFVEJ85AGmR
	KS60in1mBQN4MtVwTVXsKsbWYI8U7G6aoh5FRDhuMGhvMY3r9qhiORyJD8uaswRRU8Onho9avtx
	01qTmf/6Oqk5jF2WVTy2h89epUthANvuwQWIaN1Bv/7OomlcGXy/nbhFJ1Uttrz6Fy+7NKNA3i6
	KCNdFOdCcZrdfC3KZVDRlCCxSCD3+DD7FsQCUTitKuHrwP07Njw7fvzddiPcWXVttjy6mopYcPW
	1YbAUpUXRsjTFyBibnShQVms76bq0OkUADkskWpfzLcyI=
X-Received: by 2002:a05:7300:fd13:b0:30c:9f31:b62a with SMTP id 5a478bee46e88-30ef084fd6bmr2062142eec.10.1782868654974;
        Tue, 30 Jun 2026 18:17:34 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30efaadc5bfsm940139eec.28.2026.06.30.18.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 18:17:34 -0700 (PDT)
Date: Tue, 30 Jun 2026 18:17:31 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Conor Dooley <conor@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 01/16] riscv: Introduce instruction table generation
Message-ID: <akRqqxVMmzCJUpxp@blinky>
References: <20260621-riscv_insn_table-v2-0-7f0810ee2274@gmail.com>
 <20260621-riscv_insn_table-v2-1-7f0810ee2274@gmail.com>
 <DJMJB4B8Q57Y.34SUOKB6MD8IE@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DJMJB4B8Q57Y.34SUOKB6MD8IE@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_181736_611577_D08C91E3 
X-CRM114-Status: GOOD (  22.46  )
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

T24gVHVlLCBKdW4gMzAsIDIwMjYgYXQgMDY6NDU6NTFQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IDIwMjYtMDYtMjFUMjE6MDE6MTktMDc6MDAsIENoYXJsaWUgSmVua2lucyB2aWEg
QjQgUmVsYXkgPGRldm51bGwrdGhlY2hhcmxlc2plbmtpbnMuZ21haWwuY29tQGtlcm5lbC5vcmc+
Ogo+ID4gRnJvbTogQ2hhcmxpZSBKZW5raW5zIDx0aGVjaGFybGVzamVua2luc0BnbWFpbC5jb20+
Cj4gPgo+ID4gRWxpbWluYXRlIHRoZSBuZWVkIHRvIGhhbmQtd3JpdGUgcmlzY3YgaW5zdHJ1Y3Rp
b25zIGJ5IHVzaW5nIGEgc2hlbGwKPiA+IHNjcmlwdCB0byBhdXRvZ2VuZXJhdGUgYSBoZWFkZXIg
ZnJvbSBhbiBpbnN0cnVjdGlvbiB0YWJsZS4gVGhpcyBpcyBtb2RlbGVkCj4gPiBhZnRlciB0aGUg
c3lzY2FsbCB0YWJsZSBpbmZyYXN0cnVjdHVyZS4KPiA+Cj4gPiBUaGUgdGFibGUgaXMgZ2VuZXJh
dGVkIGV4dGVybmFsbHkgYnkgcmlzY3YtdW5pZmllZC1kYiBbMV0sIGJ1dCBpcwo+ID4gaW4gYSBz
aW1wbGUgZm9ybWF0IHRvIG1ha2UgaXQgcG9zc2libGUgdG8gdXNlIG90aGVyIHRvb2xzIG9yIG1v
ZGlmeQo+ID4gbWFudWFsbHkuCj4gPgo+ID4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1z
b2Z0d2FyZS1zcmMvcmlzY3YtdW5pZmllZC1kYgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENoYXJs
aWUgSmVua2lucyA8dGhlY2hhcmxlc2plbmtpbnNAZ21haWwuY29tPgo+ID4KPiA+IC0tLQo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvdG9vbHMvaW5zbi50YmwgYi9hcmNoL3Jpc2N2L3Rvb2xz
L2luc24udGJsCj4gPiBAQCAtMCwwICsxLDEzOTIgQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBCU0QtMy1DbGF1c2UtQ2xlYXIKPiA+ICsjCj4gPiArIyBHRU5FUkFURUQgV0lUSCBo
dHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytc29mdHdhcmUtc3JjL3Jpc2N2LXVuaWZpZWQtZGIKPiA+
ICsjICIuL2Jpbi9nZW5lcmF0ZSBpbnN0LXRhYmxlIC1vIHRlc3RfdGFibGUudHh0Igo+IAo+IEkg
Y2hlY2tlZCBvdXQgdGhlIHJlcG8sIHJhbiB0aGUgY29tbWFuZCwgYW5kIGdvdCBhIGRpZmZlcmVu
dCB0YWJsZToKPiAKPiA+ICthbmRuIGNvbW1vbiAwMTAwMDAwPDI1fDExMTwxMnwwMTEwMDExPDAg
eHMyPTI0LTIwIHhzMT0xOS0xNSB4ZD0xMS03Cj4gICAgYW5kbiBjb21tb24gMDEwMDAwMDwzMXwx
MTE8MTR8MDExMDAxMTw3IHhzMj0yNC0yMCB4czE9MTktMTUgeGQ9MTEtNwo+IAo+IEkgYXNzdW1l
IHRoZXJlIHdlcmUgc29tZSByZWNlbnQgY2hhbmdlcyBpbiB0aGUgb3V0cHV0IGZvcm1hdC4uLgo+
IAo+IEkgdGhpbmsgaXQgd291bGQgYmUgbmljZSB0byB1c2UgdGhlaXIgbGF0ZXN0IGZvcm1hdCBh
bmQgYWxzbyBub3RlIHRoZQo+IFVEQiBjb21taXQgdGhhdCB3YXMgdXNlZCwgc28gaXQncyBlYXNp
ZXIgdG8gcmVwcm9kdWNlIG91ciBmaWxlLgo+IEhvcGVmdWxseSB0aGVyZSB3b24ndCBiZSBicmVh
a2luZyBjaGFuZ2VzIHRvbyBvZnRlbi4gOikKCkkgaGF2ZSBhIFBSIG9wZW4gdG8gZml4IHRoaXMg
YnVnIHRoYXQgSSBtaXNzZWQgd2hlbiBpdCBnb3QgbWVyZ2VkLCBvbmNlCnRoYXQgZ2V0cyBtZXJn
ZWQgSSBjYW4gbGluayB0aGUgaGFzaCBhbmQgdGhlcmUgd2lsbCBubyBsb25nZXIgYmUgdGhpcwpt
aXNtYXRjaC4KCj4gCj4gVGhhbmtzLgo+IAo+IC0tLQo+IFNhc2hpa28gc2VlbXMgdG8gaGF2ZSBu
b3RpY2VkIGEgcGxlbnR5IG9mIG90aGVyIGlzc3Vlcywgc28gSSBkaWRuJ3QKPiByZXZpZXcgbW9y
ZS4uLgoKT2ggdGhhbmtzLCBJJ2xsIGNoZWNrIHRoYXQgb3V0LgoKLSBDaGFybGllCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
