Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B65EF9001
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 16:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1VgaVmGrIlJLlXuxfZo0xuwr0qSTs7VcbqpEC8oR/NU=; b=ar0yE+WnRvUkbn
	tdZHOp4O9wh37USM1DnWrtM2s2B1VV2A0Y8nBgjSMw/7zq62S+aqTGZpIPXNd19F60MlUO1LSr2Zj
	UMaNfX5Ih1kKHwmypcsicRezOnU4L8idNSdYZNCynNiqvVN1tmpQHAAfTmRCJMz0qvHfBJoVTFrau
	9W6Qd8sqwtxT3Ay1iBfGNCMf23L8fnaEA4ffrVBoqXm29U8T43xZ1QPNYUKujWqvf8UORmKaia30K
	DeLrNANjYq6pJmodkT04Ed01VJ4w7IV2O59oWDMu0hCVbJB7Fdkgg2DvdImFzU9IQNmk/S9er8qI5
	Q+6hKGEX8fDLgQZBncOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpGm-000000005v5-2tvD;
	Wed, 04 Mar 2026 16:40:20 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpGk-000000005uY-1CC6
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 16:40:19 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-79827d28feaso70490907b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 08:40:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772642417; cv=none;
        d=google.com; s=arc-20240605;
        b=gyDSsBCf+M3ekZWfRdR++ltBasm2pzE9W3meEJXTCne5zW8fni7f14zfkGo4WDO9k6
         ggVpaYKrb+4S18Mvjgzp+nNSuwe74e6RFb7fWH4w9gjkyctDUWEcD48vy1fHX1KvfdB0
         l119s1mwkQf/F1csopcrrlp/dusVPhcAPRmgntlgjIUQc+5fxFzY4URia4OtO/HPhas3
         myfPCN/3dFE0ByQ19zvbNpve8VQC99ZIdVEDw8RJkmgSl8sAq5i6Snq+pIZKgf6TUT+W
         w9EKdjjXmeAGjoi5zreP01XUSrPTDc6yIKIfOjU42vYQ77YLwhqOk5PS6nySJHgtW/gS
         AnhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7EIelfbqraTFDtG4K3GfpmwKk/JIi60v+RZZy/F1gPo=;
        fh=QAhou5nKo5VxfZHAHY3xKZi64iqorhQc+SEHxdjeMWI=;
        b=hGhAlplraqF4JdfeOSOaD2vYCAHpYcX66NmetoyBeOdnrE9pumIj7taGlIGmsPriL5
         pGYCPEGPbMkwEpv4Hfwqnm0rTrWwSa9sZCc3GEWCHODlmTxevnXDcjFSKcPrXFX5Hp8g
         98kV6ilzfbrE65pqUoCsyY3qaC/165rQsqfMceaO3NNx8FYGcAwapNUA6oYSJ27cAXXJ
         UY7DT4dX2nzMyhKMP/ys3Mdfe+doP0M+klocMCyQMDDkKj+Ns9CrZDOSLMc2ZWe7Y6dj
         vZYGhdkOsI43FLibDKruHnRYsMIDEQoo9VUMpZq/SovlGWeMjxvHBoau4+K0VAUSZTJk
         STag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1772642417; x=1773247217; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EIelfbqraTFDtG4K3GfpmwKk/JIi60v+RZZy/F1gPo=;
        b=MJfz4s6+4j21/Pjk5npTPXvLfEl+xeR3EoMLin6M7vth/8/ll5i//HYRDc0oCVZmLw
         m1DD2/V98KxDUc1rtvhvD+v8ZiQB8qpl5Lh7emOYNlu6b95gifZWZyIRNnKBblURsM+m
         AMNBs3Axn30r0pNR5ci1LT/7pdV9Mfve5lPfTmXobooFBm101f42rFqFRw6tLO8rPj+V
         FwYgahyygsfADNYOIi84cW0IJnEvD2AIClrC8+6J3jsEZXWbcI1/47jz1atiP7aQd2RH
         vqZJyUL86POldE/+Au14ot0aNIZkFMQOwBpUTOZksUwf62PXuWP0Wh7Lbr/B62/DYLtu
         ixig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772642417; x=1773247217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7EIelfbqraTFDtG4K3GfpmwKk/JIi60v+RZZy/F1gPo=;
        b=bcr5swTOMXWEEH42frlbw9dR98P9cm9FnFouc7rUJVNG9gLaQvqC7GNt1Un6OMLYBI
         ecG3L0Dw6pwwKF6t9biKGeCZ0AkNCFeFwELYMSW+ECprYOJ/xMmLhKT+2mQ2LTRXxU2w
         svneDgav01JDFHUs8tjDkDhR73tih7JwlytD8VkdpVl2iJ8VDxpqkGyWU6ue/lF+XdtX
         DtoOEiTntLRhou2sumtG4IV+He62q02Js8ZCgIwR5fH9qMctSNFvZ845gdEvdx4sID3h
         G3G6MYISOo+5LGxQRI0z6ntTZoDH28feAvPWJECIGLPnL6SsCeNQ3h2ouVtQ6U5t/UL/
         klLw==
X-Forwarded-Encrypted: i=1; AJvYcCUt/hA5E4eHFaKsqm4QPDElls3qDcqJQaC/evP5DaFNeP0/cJNq6oETCD6olBIdTQ0vppqVb2ODFwom+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWeyljKPUhEEhuivR1Gybx0QmEAtny+PEvwVXGoKCcvENMfHCg
	6HLs6Sau2euDJ8sj9SlMYuLBBzXgEgHDS+4gN1pGan3JpYJ6Y2j8S4q+ALIhPYIfR9wg/hEJqek
	zeVf6ZdlssMnKq4oCjEt3X1orPB1qCgY1kBnY0Z3tXw==
X-Gm-Gg: ATEYQzwNFKTZBmhcOTxgBurbaFoGDNzknPsAni9/iqasVCZC0wBZmfGFpFCHE+4iu8N
	1UeMhyrpVrJ7/rmQy4BJI/m9t5pXKWGLJncqUumn6zod3rst1NBJSOfqKjQ/crBeqDTGAoQA7G9
	f2BfFaL8Ev0UuBGbbF0zWYRJ2Z7JtBukKsFpyW9/FnD561ZpPez1bOYtW8f3z6tjOzOPYMs+fe2
	7LoKpz5bk/A2BPRvqk+Z7WB9+eHGNBqmE3mzAF/Wts3wGgsHwDqhcncz1lMBeabFts2ErtLTZni
	1AWOv4B3jIgOKa+g4h8KGB7Y0WPsJyYjiD3ou8vIgAXfIQAV
X-Received: by 2002:a05:690e:1182:b0:64c:c616:c31e with SMTP id
 956f58d0204a3-64cf9b4a17amr1809437d50.31.1772642416711; Wed, 04 Mar 2026
 08:40:16 -0800 (PST)
MIME-Version: 1.0
References: <20260303-atlantis-clocks-v7-0-415c9dda086a@oss.tenstorrent.com>
 <20260303-atlantis-clocks-v7-3-415c9dda086a@oss.tenstorrent.com> <aadhd3LwZQPkT3A4@redhat.com>
In-Reply-To: <aadhd3LwZQPkT3A4@redhat.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 4 Mar 2026 10:40:06 -0600
X-Gm-Features: AaiRm50FY6wPHOB4TxURj9oFXJQofl38DtBDhZDZ6HR-WZ_J2vlxwwj0jTHvOUw
Message-ID: <CAEev2e_hxUBQjVdxisqBXHQRzspQq6dHT0kCZHUW-6dEyV4faQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] clk: tenstorrent: Add Atlantis clock controller driver
To: Brian Masney <bmasney@redhat.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_084018_348952_DEEC8F32 
X-CRM114-Status: GOOD (  37.19  )
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

SGVsbG8gQnJpYW4sCgpPbiBUdWUsIE1hciAzLCAyMDI2IGF0IDQ6MzLigK9QTSBCcmlhbiBNYXNu
ZXkgPGJtYXNuZXlAcmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBIaSBBbmlydWRoLAo+Cj4gVGhhbmtz
IGZvciB0aGUgcGF0Y2guIEEgZmV3IG1pbm9yIGNvbW1lbnRzIGJlbG93IHdpdGggc29tZSBtaW5v
cgo+IG5pdHBpY2tzLCBhZGRpdGlvbmFsIHBsYWNlcyB0byB1c2UgRklFTERfR0VUKCksIHBsdXMg
c29tZSBzdWdnZXN0aW9ucwo+IGZvciBhZGRpdGlvbmFsIHJlZ21hcCBoZWxwZXJzIHRvIHVzZS4K
Pgo+IE9uIFR1ZSwgTWFyIDAzLCAyMDI2IGF0IDExOjM2OjA5QU0gLTA2MDAsIEFuaXJ1ZGggU3Jp
bml2YXNhbiB3cm90ZToKPiA+IEFkZCBkcml2ZXIgZm9yIGNsb2NrIGNvbnRyb2xsZXIgaW4gVGVu
c3RvcnJlbnQgQXRsYW50aXMgU29DLiBUaGlzIHZlcnNpb24KPiA+IG9mIHRoZSBkcml2ZXIgY292
ZXJzIGNsb2NrcyBmcm9tIFJDUFUgc3Vic3lzdGVtLgo+ID4KPiA+IDUgdHlwZXMgb2YgY2xvY2tz
IGdlbmVyYXRlZCBieSB0aGlzIGNvbnRyb2xsZXI6IFBMTHMgKFBMTHMKPiA+IHdpdGggYnlwYXNz
IGZ1bmN0aW9uYWxpdHkgYW5kIGFuIGFkZGl0aW9uYWwgR2F0ZSBjbGsgYXQgb3V0cHV0KSwgU2hh
cmVkCj4gPiBHYXRlcyAoTXVsdGlwbGUgR2F0ZSBjbGtzIHRoYXQgc2hhcmUgYW4gZW5hYmxlIGJp
dCksIHN0YW5kYXJkIE11eGVzLAo+ID4gRGl2aWRlcnMgYW5kIEdhdGVzLiBBbGwgY2xvY2tzIGFy
ZSBpbXBsZW1lbnRlZCB1c2luZyBjdXN0b20gY2xrIG9wcyBhbmQKPiA+IHVzZSB0aGUgcmVnbWFw
IGludGVyZmFjZSBhc3NvY2lhdGVkIHdpdGggdGhlIHN5c2Nvbi4gQWxsIGNsb2NrcyBhcmUgZGVy
aXZlZAo+ID4gZnJvbSBhIDI0IE1oeiBvc2NpbGxhdG9yLgo+ID4KPiA+IFRoZSByZXNldCBjb250
cm9sbGVyIGlzIGFsc28gc2V0dXAgYXMgYW4gYXV4aWxpYXJ5IGRldmljZSBvZiB0aGUgY2xvY2sK
PiA+IGNvbnRyb2xsZXIuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5pcnVkaCBTcmluaXZhc2Fu
IDxhc3Jpbml2YXNhbkBvc3MudGVuc3RvcnJlbnQuY29tPgoKPiA+ICsKPiA+ICtzdGF0aWMgdTgg
YXRsYW50aXNfY2xrX211eF9nZXRfcGFyZW50KHN0cnVjdCBjbGtfaHcgKmh3KQo+ID4gK3sKPiA+
ICsgICAgIHN0cnVjdCBhdGxhbnRpc19jbGtfbXV4ICptdXggPSBod190b19hdGxhbnRpc19jbGtf
bXV4KGh3KTsKPiA+ICsgICAgIHUzMiB2YWw7Cj4gPiArCj4gPiArICAgICByZWdtYXBfcmVhZCht
dXgtPmNvbW1vbi5yZWdtYXAsIG11eC0+Y29uZmlnLnJlZ19vZmZzZXQsICZ2YWwpOwo+ID4gKyAg
ICAgdmFsID4+PSBtdXgtPmNvbmZpZy5zaGlmdDsKPiA+ICsgICAgIHZhbCAmPSAoQklUKG11eC0+
Y29uZmlnLndpZHRoKSAtIDEpOwo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIHZhbDsKPgo+IEZJRUxE
X0dFVCgpID8KCjxjb3B5aW5nIGFub3RoZXIgc25pcHBldCBmcm9tIGJlbG93PgoKPiA+ICtzdGF0
aWMgdW5zaWduZWQgbG9uZyBhdGxhbnRpc19jbGtfZGl2aWRlcl9yZWNhbGNfcmF0ZShzdHJ1Y3Qg
Y2xrX2h3ICpodywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBsb25nIHBhcmVudF9yYXRlKQo+ID4gK3sKPiA+ICsgICAgIHN0
cnVjdCBhdGxhbnRpc19jbGtfZGl2aWRlciAqZGl2aWRlciA9IGh3X3RvX2F0bGFudGlzX2Nsa19k
aXZpZGVyKGh3KTsKPiA+ICsgICAgIHUzMiB2YWw7Cj4gPiArCj4gPiArICAgICByZWdtYXBfcmVh
ZChkaXZpZGVyLT5jb21tb24ucmVnbWFwLCBkaXZpZGVyLT5jb25maWcucmVnX29mZnNldCwgJnZh
bCk7Cj4gPiArCj4gPiArICAgICB2YWwgPj49IGRpdmlkZXItPmNvbmZpZy5zaGlmdDsKPiA+ICsg
ICAgIHZhbCAmPSAoKDEgPDwgKGRpdmlkZXItPmNvbmZpZy53aWR0aCkpIC0gMSk7Cj4KPiBGSUVM
RF9HRVQoKSA/CgpNb3N0IHVzZXMgb2YgRklFTERfR0VUIEkgc2VlIGhhdmUgdGhlIHNoaWZ0IGFu
ZCB3aWR0aCBmb3IgdGhlIG1hc2sgYmUKc3RhdGljIGNvbXBpbGUgdGltZSBjb25zdGFudHMsIHdo
aWNoIGlzbid0IHRoZSBjYXNlIGhlcmUuIEkgZG9uJ3QKdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8g
dXNlIGl0IGhlcmUuIFlvdSBjb3VsZCBtYW51YWxseSBjb21wdXRlIHRoZQptYXNrIGFuZCBwYXNz
IHRoYXQgdG8gRklFTERfR0VULCBidXQgeW91IGVuZCB1cCB3aXRoIG1vcmUgbGluZXMgb2YKY29k
ZSBhdCB0aGF0IHBvaW50Cgo+Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgYXRsYW50aXNf
Y2xrX211eF9zZXRfcGFyZW50KHN0cnVjdCBjbGtfaHcgKmh3LCB1OCBpbmRleCkKPiA+ICt7Cj4g
PiArICAgICBzdHJ1Y3QgYXRsYW50aXNfY2xrX211eCAqbXV4ID0gaHdfdG9fYXRsYW50aXNfY2xr
X211eChodyk7Cj4gPiArICAgICB1MzIgdmFsID0gaW5kZXg7Cj4gPiArCj4gPiArICAgICByZXR1
cm4gcmVnbWFwX3VwZGF0ZV9iaXRzKG11eC0+Y29tbW9uLnJlZ21hcCwgbXV4LT5jb25maWcucmVn
X29mZnNldCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKEJJVChtdXgtPmNv
bmZpZy53aWR0aCkgLSAxKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDw8IG11eC0+Y29uZmlnLnNoaWZ0LAo+Cj4gVGhpcyBkb2Vzbid0IG1ha2UgdGhlIGxpbmUg
dGhhdCBtdWNoIGxvbmdlciwgYW5kIGlzIG5pY2VyIHRvIHJlYWQ6Cj4KPiAgICAgKEJJVChtdXgt
PmNvbmZpZy53aWR0aCkgLSAxKSA8PCBtdXgtPmNvbmZpZy5zaGlmdCwKCkFjawoKPiA+ICtzdGF0
aWMgdm9pZCBhdGxhbnRpc19jbGtfZ2F0ZV9lbmRpc2FibGUoc3RydWN0IGNsa19odyAqaHcsIGlu
dCBlbmFibGUpCj4KPiBTaG91bGQgdGhpcyByZXR1cm4gYW4gaW50PyBUaGlzIGxvb2tzIGxpa2Ug
d2Ugc2hvdWxkIHVzZSB0aGlzIHJldHVybgo+IHZhbHVlIGJlbG93IGluIGF0bGFudGlzX2Nsa19n
YXRlX2VuYWJsZSgpLgo+Cj4gPiArewo+ID4gKyAgICAgc3RydWN0IGF0bGFudGlzX2Nsa19nYXRl
ICpnYXRlID0gaHdfdG9fYXRsYW50aXNfY2xrX2dhdGUoaHcpOwo+ID4gKyAgICAgdTMyIHZhbDsK
PiA+ICsKPiA+ICsgICAgIGlmIChlbmFibGUpCj4gPiArICAgICAgICAgICAgIHZhbCA9IGdhdGUt
PmNvbmZpZy5lbmFibGU7Cj4gPiArICAgICBlbHNlCj4gPiArICAgICAgICAgICAgIHZhbCA9IH4o
Z2F0ZS0+Y29uZmlnLmVuYWJsZSk7Cj4gPiArCj4gPiArICAgICByZWdtYXBfdXBkYXRlX2JpdHMo
Z2F0ZS0+Y29tbW9uLnJlZ21hcCwgZ2F0ZS0+Y29uZmlnLnJlZ19vZmZzZXQsCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgZ2F0ZS0+Y29uZmlnLmVuYWJsZSwgdmFsKTsKPgo+IFRoaXMgY2h1
bmsgY291bGQgYmUgc2ltcGxpZmllZCB0byB1c2UgcmVnbWFwX3NldF9iaXRzKCkgYW5kCj4gcmVn
bWFwX2NsZWFyX2JpdHMoKS4KPgo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW50IGF0bGFudGlz
X2Nsa19nYXRlX2VuYWJsZShzdHJ1Y3QgY2xrX2h3ICpodykKPiA+ICt7Cj4gPiArICAgICBhdGxh
bnRpc19jbGtfZ2F0ZV9lbmRpc2FibGUoaHcsIDEpOwo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIDA7
Cj4KPiBGb2xsb3cgdXAgZnJvbSBhYm92ZS4gQW55IHJlYXNvbiB3aHkgdGhlIHJldHVybiB2YWx1
ZSBvZgo+IHJlZ21hcF91cGRhdGVfYml0cygpIGluIGF0bGFudGlzX2Nsa19nYXRlX2VuZGlzYWJs
ZSgpIGlzIGRpc2NhcmRlZD8KPgo+IEkga25vdyBpdCdzIG5vdCB1c2VkIGJlbG93IGluIHRoZSBk
aXNhYmxlKCkuCgpGb3Igc29tZSByZWFzb24sIGNsa19nYXRlX2VuYWJsZSByZXR1cm5zIGFuIGlu
dCAoSSBndWVzcyB3ZSBjYXJlIGFib3V0CmVycm9ycyBoZXJlKSwgd2hpbGUgY2xrX2dhdGVfZGlz
YWJsZSBkb2Vzbid0IHJldHVybiBhbnl0aGluZyAoYnV0IHdlCmRvbid0IGhlcmU/KS4gSSd2ZSB1
cGRhdGVkIHRoZW0gKGFuZCBjbGtfZ2V0X2VuZGlzYWJsZSkgYmFzZWQgb24geW91cgpzdWdnZXN0
aW9ucyBzbyB0aGF0IHRoZSByZXR1cm4gY29kZSBmcm9tIHJlZ21hcF97c2V0fGNsZWFyfV9iaXRz
IGlzCnBhc3NlZCB0aHJvdWdoLgoKPiA+ICsKPiA+ICtzdGF0aWMgaW50IGF0bGFudGlzX2Nsa19w
bGxfaXNfZW5hYmxlZChzdHJ1Y3QgY2xrX2h3ICpodykKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3Qg
YXRsYW50aXNfY2xrX3BsbCAqcGxsID0gaHdfdG9fYXRsYW50aXNfcGxsKGh3KTsKPiA+ICsgICAg
IHUzMiB2YWwsIGVuX3ZhbCwgY2dfdmFsOwo+ID4gKwo+ID4gKyAgICAgcmVnbWFwX3JlYWQocGxs
LT5jb21tb24ucmVnbWFwLCBwbGwtPmNvbmZpZy5yZWdfb2Zmc2V0LCAmdmFsKTsKPiA+ICsgICAg
IHJlZ21hcF9yZWFkKHBsbC0+Y29tbW9uLnJlZ21hcCwgcGxsLT5jb25maWcuZW5fcmVnX29mZnNl
dCwgJmVuX3ZhbCk7Cj4gPiArICAgICByZWdtYXBfcmVhZChwbGwtPmNvbW1vbi5yZWdtYXAsIHBs
bC0+Y29uZmlnLmNnX3JlZ19vZmZzZXQsICZjZ192YWwpOwo+ID4gKwo+ID4gKyAgICAgLyogQ2hl
Y2sgaWYgUExMIGlzIHBvd2VyZWQgb24sIGxvY2tlZCwgbm90IGJ5cGFzc2VkIGFuZCBHYXRlIGNs
ayBpcyBlbmFibGVkICovCj4gPiArICAgICByZXR1cm4gISEoZW5fdmFsICYgUExMX0NGR19FTl9C
SVQpICYmICEhKHZhbCAmIFBMTF9DRkdfTE9DS19CSVQpICYmCj4gPiArICAgICAgICAgICAgKCFw
bGwtPmNvbmZpZy5jZ19yZWdfZW5hYmxlIHx8IChjZ192YWwgJiBwbGwtPmNvbmZpZy5jZ19yZWdf
ZW5hYmxlKSkgJiYKPiA+ICsgICAgICAgICAgICAhKHZhbCAmIFBMTF9DRkdfQllQQVNTX0JJVCk7
Cj4KPiBDb3VsZCByZWdtYXBfdGVzdF9iaXRzKCkgbWFrZSB0aGlzIGEgYml0IGNsZWFuZXI/Cj4K
PiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGludCBhdGxhbnRpc19jbGtfcGxsX2VuYWJsZShzdHJ1
Y3QgY2xrX2h3ICpodykKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgYXRsYW50aXNfY2xrX3BsbCAq
cGxsID0gaHdfdG9fYXRsYW50aXNfcGxsKGh3KTsKPiA+ICsgICAgIHUzMiB2YWwsIGVuX3ZhbCwg
Y2dfdmFsOwo+ID4gKyAgICAgaW50IHJldDsKPiA+ICsKPiA+ICsgICAgIHJlZ21hcF9yZWFkKHBs
bC0+Y29tbW9uLnJlZ21hcCwgcGxsLT5jb25maWcucmVnX29mZnNldCwgJnZhbCk7Cj4gPiArICAg
ICByZWdtYXBfcmVhZChwbGwtPmNvbW1vbi5yZWdtYXAsIHBsbC0+Y29uZmlnLmVuX3JlZ19vZmZz
ZXQsICZlbl92YWwpOwo+ID4gKyAgICAgcmVnbWFwX3JlYWQocGxsLT5jb21tb24ucmVnbWFwLCBw
bGwtPmNvbmZpZy5jZ19yZWdfb2Zmc2V0LCAmY2dfdmFsKTsKPiA+ICsKPiA+ICsgICAgIC8qIENo
ZWNrIGlmIFBMTCBpcyBhbHJlYWR5IGVuYWJsZWQsIGxvY2tlZCwgbm90IGJ5cGFzc2VkIGFuZCBH
YXRlIGNsayBpcyBlbmFibGVkICovCj4gPiArICAgICBpZiAoKGVuX3ZhbCAmIFBMTF9DRkdfRU5f
QklUKSAmJiAodmFsICYgUExMX0NGR19MT0NLX0JJVCkgJiYKPiA+ICsgICAgICAgICAoIXBsbC0+
Y29uZmlnLmNnX3JlZ19lbmFibGUgfHwgKGNnX3ZhbCAmIHBsbC0+Y29uZmlnLmNnX3JlZ19lbmFi
bGUpKSAmJgo+ID4gKyAgICAgICAgICEodmFsICYgUExMX0NGR19CWVBBU1NfQklUKSkgewo+Cj4g
U2FtZSBhYm91dCByZWdtYXBfdGVzdF9iaXRzKCkgaGVyZS4KClRoZXNlIGluc3RhbmNlcyBoYXZl
IGl0IHJlYWRpbmcgMyBkaWZmZXJlbnQgcmVnaXN0ZXJzICh1bmxpa2UgYWxtb3N0CmFsbCB0aGUg
b3RoZXIgZXhhbXBsZXMgdGhhdCBqdXN0IHJlYWQgb25lKSBhbmQgdGVzdGluZyBiaXRzIGFjcm9z
cwp0aGVtLiBCdXQgSSBndWVzcyBpdCBzaG91bGQgYmUgcG9zc2libGUgdG8gdXNlIHRlc3RfYml0
cyBoZXJlIHRvby4gSQp3aWxsIHVwZGF0ZSB0aGVtLgoKPgo+ID4gKyAgICAgICAgICAgICByZXR1
cm4gMDsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIC8qIFN0ZXAgMTogU2V0IGJ5cGFzcyBt
b2RlIGZpcnN0ICovCj4gPiArICAgICByZWdtYXBfdXBkYXRlX2JpdHMocGxsLT5jb21tb24ucmVn
bWFwLCBwbGwtPmNvbmZpZy5yZWdfb2Zmc2V0LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
IFBMTF9DRkdfQllQQVNTX0JJVCwgUExMX0NGR19CWVBBU1NfQklUKTsKPiA+ICsKPiA+ICsgICAg
IC8qIFN0ZXAgMjogRW5hYmxlIFBMTCAoY2xlYXIgdGhlbiBzZXQgcG93ZXIgYml0KSAqLwo+ID4g
KyAgICAgcmVnbWFwX3VwZGF0ZV9iaXRzKHBsbC0+Y29tbW9uLnJlZ21hcCwgcGxsLT5jb25maWcu
ZW5fcmVnX29mZnNldCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICBQTExfQ0ZHX0VOX0JJ
VCwgMCk7Cj4gPiArCj4gPiArICAgICByZWdtYXBfdXBkYXRlX2JpdHMocGxsLT5jb21tb24ucmVn
bWFwLCBwbGwtPmNvbmZpZy5lbl9yZWdfb2Zmc2V0LAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgIFBMTF9DRkdfRU5fQklULCBQTExfQ0ZHX0VOX0JJVCk7Cj4gPiArCj4gPiArICAgICAvKiBT
dGVwIDM6IFdhaXQgZm9yIFBMTCBsb2NrICovCj4gPiArICAgICByZXQgPSByZWdtYXBfcmVhZF9w
b2xsX3RpbWVvdXQocGxsLT5jb21tb24ucmVnbWFwLAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBsbC0+Y29uZmlnLnJlZ19vZmZzZXQsIHZhbCwKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2YWwgJiBQTExfQ0ZHX0xPQ0tfQklULCAxMCwK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQTExfQllQQVNTX1dBSVRf
VVMpOwo+Cj4gU2hvdWxkIHRoZSBsYXN0IHR3byBwYXJhbWV0ZXJzIGJlCj4gUExMX0JZUEFTU19X
QUlUX1VTLCBQTExfTE9DS19USU1FT1VUX1VTIGluc3RlYWQgb2YKPiAxMCwgUExMX0JZUEFTU19X
QUlUX1VTPwoKWWVzLCB0aGFua3MgZm9yIGNhdGNoaW5nIHRoaXMuCgo+ID4gKwo+ID4gKyAgICAg
Zm9yIChpID0gMDsgaSA8IGRhdGEtPm51bTsgaSsrKSB7Cj4gPiArICAgICAgICAgICAgIHN0cnVj
dCBjbGtfaHcgKmh3ID0gZGF0YS0+aHdzW2ldOwo+ID4gKyAgICAgICAgICAgICBzdHJ1Y3QgYXRs
YW50aXNfY2xrX2NvbW1vbiAqY29tbW9uID0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBod190
b19hdGxhbnRpc19jbGtfY29tbW9uKGh3KTsKPiA+ICsgICAgICAgICAgICAgY29tbW9uLT5yZWdt
YXAgPSByZWdtYXA7Cj4gPiArCj4gPiArICAgICAgICAgICAgIHJldCA9IGRldm1fY2xrX2h3X3Jl
Z2lzdGVyKGRldiwgaHcpOwo+ID4gKwo+Cj4gUmVtb3ZlIG5ld2xpbmUKPgo+ID4gKyAgICAgICAg
ICAgICBpZiAocmV0KQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiAr
Cj4gPiArICAgICAgICAgICAgIGNsa19kYXRhLT5od3NbY29tbW9uLT5jbGtpZF0gPSBodzsKPiA+
ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIGNsa19kYXRhLT5udW0gPSBudW1fY2xrczsKPiA+ICsK
PiA+ICsgICAgIHJldCA9IGRldm1fb2ZfY2xrX2FkZF9od19wcm92aWRlcihkZXYsIG9mX2Nsa19o
d19vbmVjZWxsX2dldCwgY2xrX2RhdGEpOwo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIHJldDsKPgo+
IFRoZXNlIDMgbGluZXMgY2FuIGJlIHNpbXBsaWZpZWQgdG8gcmV0dXJuIGRldm1fLi4oKTsKCkRv
bmUKClRoYW5rcyBmb3IgeW91ciBjb21tZW50cy4gSSd2ZSBpbmNvcnBvcmF0ZWQgIHRoZSBjaGFu
Z2VzIHlvdSBzdWdnZXN0ZWQKb24gdXNpbmcgcmVnbWFwIGhlbHBlcnMuIEkgbGVmdCBzb21lIGNv
bW1lbnRzIG9uIHRoZSB1c2Ugb2YgRklFTERfR0VULgpMZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBh
bnkgb3RoZXIgc3VnZ2VzdGlvbnMuIEknbGwgc2VuZCBhbiB1cGRhdGVkCnZlcnNpb24gYnkgdGhl
IGVuZCBvZiB0aGlzIHdlZWsuCgo+Cj4gQnJpYW4KPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
