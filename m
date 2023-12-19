Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A759EC35274
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 00:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ncctdrc1gml888JLE7odR816KcihrdLsOGH5Gu05Bc=; b=U7wgUYVXs5Zb8i
	NTYf94fRstaKVJYk2E/YodePO2jIgo1RbXz/wmioIE/VYD45hHqoihatbONk/D/zBoNgt07epEsba
	6YvqY3cHFWMhSYsR9pDG4SOuDkpirDK0WsPQXvmwDc696Ij03edSmb/NHwYGvY6GQi+wa+KiTtN75
	k6P7osbBoxyoGIQcAtg0mmf1lW50wInPV84cGvC8jFD7+eaalQL+k0tHz/8UebwyhcQicV59tcqUE
	2wMQB6gtX3C6MZHXxsNYnu3RkvojTQmSabf10EjI2YhQ9NzV6MdvJIZUY9i6Z2F1uKMYLmHy7i44U
	FUxQrPqxnqf/W8rvDxiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFOIe-00CRtZ-3B;
	Tue, 19 Dec 2023 00:49:32 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFOIa-00CRsV-22
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 00:49:30 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2cc6eecd319so24331481fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Dec 2023 16:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1702946964; x=1703551764; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ez3c6gLJQTM1xEl9vrsUm/CRp88KyDpLDlUqP6UiLU=;
        b=oHE2lRIdKMu8YTqE1fWVQuGfHpTP3/K8tkd0qQ2OQRYzghNii/maPOXpom11fGNCZh
         KZdSf5P0WWD90rxaECIcygZYgXuGoHUa2VIPT8r66YsNvqwIkL/E7TWMltGKHUW8icb0
         M4GSaft8YZmw2AnNJlbOBPN+SfV24U377IIAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702946964; x=1703551764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Ez3c6gLJQTM1xEl9vrsUm/CRp88KyDpLDlUqP6UiLU=;
        b=X/nDPbcbawFlFdFCoYj+ux6cEY9snto5ToltY6QPO57ZZNhONhfgMiH/il6+bxvWDK
         bA4skzlFxFJkZAn1UaBd0i21KcR2w5K+rQi4z/CAu1bSo3wXPUsTe12aj/q63jkwZt0Q
         WrnjR6KbpGttOIBBsbBWLr+dTGJyFoWoCcgx/dCpeyMwq7TjlcZ78VtoK41tHxtV5uyl
         rxmCQmBm7HvgiuCcGeuC+C1ANdLIjHkyk5mk0sfo8vqto9QOm7eav4X5Oja9TBzmkhLh
         YBA+SC4qMqdWCo5IpRWXLSk6ESDiM9Or7yKmYBo0F7v5CCTqYwn7LYGAzzSock2mldA+
         FRug==
X-Gm-Message-State: AOJu0YwKciDf4lu2uwopEJVq8ePsI5OnAEOv2aUL54VY95rZ7lciUptg
	qcokJ0H2SgNdK7g9LTsY5qu2yztkCrQTAoYTsi6Z
X-Google-Smtp-Source: AGHT+IFSnv+UBG26wPKYz6so6qFuZwW7T8Q4zNpPNVBVsjUhYX6zMiZmS3kJpFdhaJxJK09EWWJMQPQYG8ealNdm2Ls=
X-Received: by 2002:a05:6512:3045:b0:50e:3776:2e16 with SMTP id
 b5-20020a056512304500b0050e37762e16mr1994822lfb.73.1702946964384; Mon, 18 Dec
 2023 16:49:24 -0800 (PST)
MIME-Version: 1.0
References: <20231217204019.36492-15-ajones@ventanamicro.com> <20231217204019.36492-17-ajones@ventanamicro.com>
In-Reply-To: <20231217204019.36492-17-ajones@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 18 Dec 2023 16:49:13 -0800
Message-ID: <CAOnJCUJ4pghg270dC54GUcLobtt6-E6sW4_kSWiLMVUACvEYug@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] RISC-V: Add SBI STA extension definitions
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, anup@brainfault.org, 
	pbonzini@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu, 
	guoren@kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_164928_680588_372FE5CE 
X-CRM114-Status: GOOD (  11.97  )
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

T24gU3VuLCBEZWMgMTcsIDIwMjMgYXQgMTI6NDDigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoZSBTQkkgU1RBIGV4dGVuc2lvbiBlbmFibGVz
IHN0ZWFsLXRpbWUgYWNjb3VudGluZy4gQWRkIHRoZQo+IGRlZmluaXRpb25zIGl0IHNwZWNpZmll
cy4KPgo+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAu
Y29tPgo+IFJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgo+IFNp
Z25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0t
Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggfCAxNyArKysrKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4g
aW5kZXggMDg5MmY0NDIxYmM0Li5iNmY4OThjNTY5NDAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9zYmkuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgK
PiBAQCAtMzEsNiArMzEsNyBAQCBlbnVtIHNiaV9leHRfaWQgewo+ICAgICAgICAgU0JJX0VYVF9T
UlNUID0gMHg1MzUyNTM1NCwKPiAgICAgICAgIFNCSV9FWFRfUE1VID0gMHg1MDRENTUsCj4gICAg
ICAgICBTQklfRVhUX0RCQ04gPSAweDQ0NDI0MzRFLAo+ICsgICAgICAgU0JJX0VYVF9TVEEgPSAw
eDUzNTQ0MSwKPgo+ICAgICAgICAgLyogRXhwZXJpbWVudGFscyBleHRlbnNpb25zIG11c3QgbGll
IHdpdGhpbiB0aGlzIHJhbmdlICovCj4gICAgICAgICBTQklfRVhUX0VYUEVSSU1FTlRBTF9TVEFS
VCA9IDB4MDgwMDAwMDAsCj4gQEAgLTI0Myw2ICsyNDQsMjIgQEAgZW51bSBzYmlfZXh0X2RiY25f
ZmlkIHsKPiAgICAgICAgIFNCSV9FWFRfREJDTl9DT05TT0xFX1dSSVRFX0JZVEUgPSAyLAo+ICB9
Owo+Cj4gKy8qIFNCSSBTVEEgKHN0ZWFsLXRpbWUgYWNjb3VudGluZykgZXh0ZW5zaW9uICovCj4g
K2VudW0gc2JpX2V4dF9zdGFfZmlkIHsKPiArICAgICAgIFNCSV9FWFRfU1RBX1NURUFMX1RJTUVf
U0VUX1NITUVNID0gMCwKPiArfTsKPiArCj4gK3N0cnVjdCBzYmlfc3RhX3N0cnVjdCB7Cj4gKyAg
ICAgICBfX2xlMzIgc2VxdWVuY2U7Cj4gKyAgICAgICBfX2xlMzIgZmxhZ3M7Cj4gKyAgICAgICBf
X2xlNjQgc3RlYWw7Cj4gKyAgICAgICB1OCBwcmVlbXB0ZWQ7Cj4gKyAgICAgICB1OCBwYWRbNDdd
Owo+ICt9IF9fcGFja2VkOwo+ICsKPiArI2RlZmluZSBTQklfU1RBX1NITUVNX0RJU0FCTEUgICAg
ICAgICAgLTEKPiArCj4gKy8qIFNCSSBzcGVjIHZlcnNpb24gZmllbGRzICovCj4gICNkZWZpbmUg
U0JJX1NQRUNfVkVSU0lPTl9ERUZBVUxUICAgICAgIDB4MQo+ICAjZGVmaW5lIFNCSV9TUEVDX1ZF
UlNJT05fTUFKT1JfU0hJRlQgICAyNAo+ICAjZGVmaW5lIFNCSV9TUEVDX1ZFUlNJT05fTUFKT1Jf
TUFTSyAgICAweDdmCj4gLS0KPiAyLjQzLjAKPgoKUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxh
dGlzaHBAcml2b3NpbmMuY29tPgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
