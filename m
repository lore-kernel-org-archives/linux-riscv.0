Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E224EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 17:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A/WFYNL0Ag3ThD8lGxd1p1vPHCkalSRtJ07NAZqDiI4=; b=zNmvV5E9a/iuku
	HZJg6TG5IYTaTvsodcZVxXdNcGu0QXJL7isII+KaPPyaugVsdw00L7yehujFpxYWuhvoe6pdCsT2U
	KYBqaHlf3nec8tqkK+LTXF/t4kjWIejzDx00nH9+zwjvihEInj205NIo96UHAZ8pDiinrEcpSKGGv
	pVuscRrn7cNVA/ph2wXNg3WNsHdUD3BtCQrwOEwlcfkj6fQiiF0AMSOY5czuESrg4g0FFtVMgEF2J
	HyufW6+JAuID8uCeFcINFln31OgCQXon+NSyGZWl3kgFKaI89/WvbyWmEfEpW8g5oO+Gi+PvGNnAk
	URKeOyT8INvZOhJzHkEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEZ3O-00GIPQ-0E;
	Wed, 28 Jun 2023 17:34:06 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEZ3K-00GINj-0P
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 17:34:03 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fb8ede27eeso1952944e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jun 2023 10:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687973636; x=1690565636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mu8Gi2wSnoTXkOMcCin+xgkyW4SfsZOtfaMQ9m+MZ5U=;
        b=ctXSjsQSzaufeY9GTPqn+avzhgMNvjo9PgbMSWr3gC1OzFmKrqHpkfW/Hh4/BxaRHj
         oatlyGdfBX5is3/rXAkRtPpuVaBjnbVAWHtGueEalCtd0kiWVV+nHvycDQA6ttsaegMd
         3lcR9743n2mULg7SZFP8WAzgB7VrDSJyHfySHd5R6/1eVpsEDvWiJ7WrXlv0a9KSs29x
         WETDEpY2W0csY2Kc8h8MS0M9gIM0+saldCRjt5f4n2ePrtvwjqb9Q37Q+s3b2t5w550r
         rE7oMwUkLRYM2F7ETOGVj7LBn7mLZofgXEPOlaZgFM5DxnuqH6dXXJk0pzK8+aL2GhCR
         7xfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687973636; x=1690565636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mu8Gi2wSnoTXkOMcCin+xgkyW4SfsZOtfaMQ9m+MZ5U=;
        b=czNuyr/8ILqrig4gyzrYjRLdtwFBJAHsuDTdysLXFxB8SYEea8WUyQVWHGbdohcq+l
         jw+9LxbkHacr8QEolAfABwccDLsm156355oOMZegmQifd7JIRt153R6ox5dqPVsTgk6i
         ChBYI/qg7O0QUFFl916d3X9CXvn5RKoljhGHov8PoGWyYiv0xe4fSboreVbIGtgX6DPJ
         i7xMZ5hf1fd9bdDNgwsStAh73+D7fcF2astt3A7unb++Cr0drleNAsvNCsINT+v32XH/
         d7YtRrUh/JWa16oZ72jiXmFnUNbInJJmEBi0Y75DupdDDpmOMf6d8NiXY17WUy2PHOUt
         019A==
X-Gm-Message-State: AC+VfDyUOUiQdIkhENLRkEGrqu9NqwstnZ5Vn5Mw37VENgYiOEyO/k1t
	NA37gCSU2B7SMP8QU90IsMQRIVRIU2qE56uWCQ0TJQ==
X-Google-Smtp-Source: ACHHUZ7/LXypQ2b7zt5BdRodKsoDzSYUcdIaTGpou0UZUfpPyxiEPFkUIurdLsWJ+cccDbdbnTpgIrlMLbBaiJoTBCY=
X-Received: by 2002:a19:7710:0:b0:4f8:6800:86f6 with SMTP id
 s16-20020a197710000000b004f8680086f6mr16992828lfc.49.1687973636628; Wed, 28
 Jun 2023 10:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230626-provable-angrily-81760e8c3cc6@wendy> <20230626-sensuous-clothing-124f7ae0aedf@wendy>
In-Reply-To: <20230626-sensuous-clothing-124f7ae0aedf@wendy>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 28 Jun 2023 10:33:20 -0700
Message-ID: <CALs-HstDV3PjBk_8WDecwuvVK9rno1CKFzT1+8ohoUXE7X0GwA@mail.gmail.com>
Subject: Re: [PATCH v1 6/9] RISC-V: add single letter extensions to riscv_isa_ext
To: Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_103402_163583_AED7A3A4 
X-CRM114-Status: GOOD (  17.10  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMjYsIDIwMjMgYXQgNDoyMeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gU28gdGhhdCByaXNjdl9maWxsX2h3Y2FwKCkg
Y2FuIHVzZSByaXNjdl9pc2FfZXh0IHRvIHByb2JlIGZvciBzaW5nbGUKPiBsZXR0ZXIgZXh0ZW5z
aW9ucywgYWRkIHRoZW0gdG8gaXQuIHJpc2N2X2lzYV9leHRfZGF0YSBncm93cyBhIG5ldwo+IG1l
bWJlciwgc2lnbmlmeWluZyB3aGV0aGVyIGFuIGV4dGVuc2lvbiBpcyBtdWx0aS1sZXR0ZXIgJiB0
aHVzIHJlcXVpcmluZwo+IHNwZWNpYWwgaGFuZGxpbmcuCj4gQXMgYSByZXN1bHQsIHdoYXQgZ2V0
cyBzcGF0IG91dCBpbiAvcHJvYy9jcHVpbmZvIHdpbGwgYmVjb21lIGJvcmtlZCwgYXMKPiBzaW5n
bGUgbGV0dGVyIGV4dGVuc2lvbnMgd2lsbCBiZSBwcmludGVkIGFzIHBhcnQgb2YgdGhlIGJhc2Ug
ZXh0ZW5zaW9ucwo+IGFuZCB3aGlsZSBwcmludGluZyBmcm9tIHJpc2N2X2lzYV9hcnIuIFRha2Ug
dGhlIG9wcG9ydHVuaXR5IHRvIHVuaWZ5IHRoZQo+IHByaW50aW5nIG9mIHRoZSBpc2Egc3RyaW5n
LCB1c2luZyB0aGUgbmV3IG1lbWJlciBvZiByaXNjdl9pc2FfZXh0X2RhdGEKPiBpbiB0aGUgcHJv
Y2Vzcy4KPgo+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8ICAxICsK
PiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMgICAgICAgIHwgMzYgKysrKysrLS0tLS0tLS0tLS0t
LS0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCA1NiArKysrKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygr
KSwgNDcgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gaW5kZXggYTM1YmVl
MjE5ZGQ3Li42YWQ4OTZkYzQzNDIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gQEAgLTc3
LDYgKzc3LDcgQEAgdW5zaWduZWQgbG9uZyByaXNjdl9nZXRfZWxmX2h3Y2FwKHZvaWQpOwo+ICBz
dHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHsKPiAgICAgICAgIGNvbnN0IHVuc2lnbmVkIGludCBp
ZDsKPiAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWU7Cj4gKyAgICAgICBjb25zdCBib29sIG11bHRp
X2xldHRlcjsKCkluc3RlYWQgb2YgZGVmaW5pbmcgYSBuZXcgbWVtYmVyLCBjb3VsZCB3ZSBqdXN0
IGluZmVyIHRoaXMgYnkgbWFraW5nIGEKbWFjcm8gbGlrZSAjZGVmaW5lIE1VTFRJX0xFVFRFUihu
YW1lKSAobmFtZVswXSAmJiBuYW1lWzFdKT8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
