Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8F4CD4F4A
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 17:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqoCteYL6jdDMUmyD4DvSK6bDqitCK5UNEsGRRlL1AQ=; b=0y90i0VQLeiU/e
	pjyvdBRiDDXW/85xzRf8tjsNGX/4RawrI9hmY9JqNTMchCHoaypAcjEHr9wq8tBMHSTCbmki8G6e0
	/DVVlbRun6WLOrk86AfNuxUCDxafshkiYblUEyYaZQDnodtTWrVZf++dXLpHbTPDB7ylNKZRhGXYI
	i1ROdGHGW2pysblH9+HpP9lvt5PxFLhtfW+LpjuhDP1qLcS60ye8Q2WdWb36Aujfyus6eV44FRJq9
	U8dVPrOM6y8gUWBMr5vZjTGmiLImQ2teTH6I7JQo7Pz2aBG4d3TmbEhcZz2vlgkQXf0X8dr9IzlHb
	Fc2LV2dx1nhFCXQQlQVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOfDd-0000000D6JO-1VHo;
	Sun, 17 May 2026 17:24:01 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOfDa-0000000D6I8-24Ut
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 17:23:59 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so785ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 May 2026 10:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779038637; cv=none;
        d=google.com; s=arc-20240605;
        b=LzSzUEVCQrqP+94wdfYRaXbAZg6KQ4n0x/EGCkT+8OXz25MjFIrohFF94Wo5HNt15M
         4UeE/A78BGWwIQp2GZkLkDFUxczB/NzQqBuDt+IGyglKRmTFUe2nbquAk+JkYtJpmnHE
         802eojpmoPGivtNYarN7i+0xIqYwmlU1Xts1bPT1J3uFGNl4nORe7CFazLFzG8ki0Ixn
         CnQRCKHYlPyVKKcxdD7R4Rs7bAOH9V/PdLGWFkOQTljqO2kqu2s+GX56o778eb0ejMYm
         aJMwUJuO0ECi96C3HX6mnjrpZXsfZdMgc1bMLbRIvrzR73u3kdJd09TLQXsxFnfq7Q66
         jcgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SGJG9ixedY3dsifAWRpwM476JJR6wZkEpduvZ4yEvkg=;
        fh=pVw+QHmlUFjqdQuKEwaUScY82q2SKfrGgorSfS7m030=;
        b=TQlKIC9CYWpC8qZi3LfdjQs+OlWwCKqMktIgd+R5XGF9U76jY6x4ta14deUUA5HFRZ
         A4HaJbrKuWnEeMx26yiAJIoFd62q9sE0GzOGbvKQHSgq7Bsp1eUfQ315OkdU5gHYK+Zc
         bfGLaOk+qux4wtScr926o9UKpS/Z1cJaXo/PopC4IdOd4TyA73BC1C6wnDDfUC0A4MCq
         pu6U4EoYiJLDmzshpLskeODbGLw7W1Va8aiUV0pOJ0wbTP0NftTSwpDTx+P4XX6W/EOX
         xBdnoZtO4WaFf/ggKkVTPWdWb2lYR4WH3aHFPcVDnpeASpnDn29+kdYWz0S+39K0TY+z
         b7gg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779038637; x=1779643437; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGJG9ixedY3dsifAWRpwM476JJR6wZkEpduvZ4yEvkg=;
        b=SulZ2n3ClPdMdA7Nx/Zt9tdaA/PkBfpwO4kPGmXhr3hzAJ+pnxJ8aGCF1hClbed8qQ
         MbvJ2ACX2wx8ud71aT5RVBxXQ8nBjGaq++9pQ9eXAKF01YQ9arwtzfOjAbpF1i6Hz2pq
         gM46H8Y6C+0ervIelWzKwM8klPagZSrW8kN1/tehwDfVCGlEOQVHrrOWwSV0dZJ+0MMD
         9iV+yHy14ZJd9Qpuv2ChjRLlLicoXn8nzpcxLD/+Al/69hMWKORYdnPeuyoxUe3EKo1h
         rIOPV9+NJfJgLjR1dTGZ6qGjYrOyuajpSicM3QTytpO39c5YyxOngzsSjTcCtCsihnDl
         6e2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779038637; x=1779643437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SGJG9ixedY3dsifAWRpwM476JJR6wZkEpduvZ4yEvkg=;
        b=H0z8ctfB8kIOqPc8rIe4XX3LcSW9iqoZ2S954Zldd9G19ZU4TMSUpSDN4gS1Vg/Fl7
         UTTIfJtGFbcKPCzevPKaDhCAN2k50KLpJZZvkbpcy+GzIMqSJEtJ1m9+jH+qQ1BbiOlR
         Gv38wcj2qcX0KQa6xpWE6GA4EnesPPDceo7Lw17/U9BRaHZMocJBORNXjCUJ+NgdzT38
         ShvIfnU/4auDaaDIURlRALVLoZ9zUoLeMpIV1FV5QtdCgNm/BXSY/vJHu/GGYd3yxSbj
         Csg/UH6Ln1iCViEnEmclmMqTg0HY0GyKPOE4uRckAaRpNELvv5fVgWNG9/bd2rxE9oLI
         TlJw==
X-Forwarded-Encrypted: i=1; AFNElJ88BclzfVDooGJ7iNuGBROxZ8iAjggC3gPST18vCafFtTNXMTWZG2vuAPBVDBuqYFNCRsXznEka/Zv7KQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVbt6mjnIjvs5NmB65uRvrKzKuorMYaeqqtZ3GywydRLPIbbui
	qm1+frmyNls1i5rwjd7ioNT+76SkPiWBeB8YDIh9wbTeK2hOfnslOTENUJQMhcYwgFadhfOpbcB
	wmvNGpOq4eYIZfK5RkqH7qF/alEW1kHzdntXh+9bb
X-Gm-Gg: Acq92OHeHBcoEWmRSoQBTLUCrn+GI/LVnkgyiyFi2Zb+HyIbUiucvElPlX+juKeCaou
	IwTgrDYiuEM7/mZAWvIU975mY/y+Ou1KXKlQzp0OmEbvmjGQCkJaM+YtYtK8dzZtbWZa2QZUUXb
	s0ryAygpHps6zTcWxujfVSrS+msD8eZqJt097ohinHFo9jnJ8yOoJJ0mrGJoh6c4VD4MmHM+eyZ
	5K5qdvoAFo64sez1KZGgvGtrSP3BCGNZNq6r9pfzbSi6NGuQqXHuoqNe1UdhBezxIj3MvTtvQx7
	Ei87cuPo9mNkE7r2KN4=
X-Received: by 2002:a17:902:d4c4:b0:2ae:80a3:98a9 with SMTP id
 d9443c01a7336-2bdb32c2d37mr1167585ad.11.1779038636024; Sun, 17 May 2026
 10:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260413024805.1316480-1-irogers@google.com> <20260513233151.572332-1-irogers@google.com>
 <20260513233151.572332-5-irogers@google.com> <agdyluuau3wPQOtX@x1>
 <CAP-5=fUeGOSH1LO1oSbWnpmXfv_RzxfFE+YCQ07PC19gLHDEsA@mail.gmail.com> <ageGsOVhDDKnvQhQ@x1>
In-Reply-To: <ageGsOVhDDKnvQhQ@x1>
From: Ian Rogers <irogers@google.com>
Date: Sun, 17 May 2026 10:23:44 -0700
X-Gm-Features: AVHnY4JUTcrJTBzz5U7-VpKwbcc8eerSQ_000WG5_wnMHmZQGZGfdOC7RDHXMOQ
Message-ID: <CAP-5=fW9aJyt7VojbZqkiHdiFgEcofKHpYrd9BHMSAOLRkfApw@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] perf unwind-libunwind: Make libunwind register
 reading cross platform
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, namhyung@kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Li Guan <guanli.oerv@isrc.iscas.ac.cn>, 
	9erthalion6@gmail.com, alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	howardchu95@gmail.com, john.g.garry@oracle.com, jolsa@kernel.org, 
	leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org, 
	shimin.guo@skydio.com, tglozar@redhat.com, tmricht@linux.ibm.com, 
	will@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_102358_565233_1C7C1777 
X-CRM114-Status: GOOD (  19.30  )
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

T24gRnJpLCBNYXkgMTUsIDIwMjYgYXQgMTo0OOKAr1BNIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVs
bwo8YWNtZUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgTWF5IDE1LCAyMDI2IGF0IDEy
OjM4OjQ4UE0gLTA3MDAsIElhbiBSb2dlcnMgd3JvdGU6Cj4gPiBPbiBGcmksIE1heSAxNSwgMjAy
NiBhdCAxMjoyM+KAr1BNIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyA8YWNtZUBrZXJuZWwub3Jn
PiB3cm90ZToKPgo+ID4gPiArKysgYi90b29scy9wZXJmL3V0aWwvbGlidW53aW5kLWFyY2gvbGli
dW53aW5kLXBwYzMyLmMKPiA+ID4gQEAgLTIzLDYgKzIzLDggQEAgaW50IF9fZ2V0X3BlcmZfcmVn
bnVtX2Zvcl91bndfcmVnbnVtX3BwYzMyKGludCB1bndfcmVnbnVtIF9fbWF5YmVfdW51c2VkKQo+
ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIFBFUkZfUkVHX1BPV0VSUENfQ1RSOwo+ID4gPiAg
ICAgICAgIGNhc2UgVU5XX1BQQzMyX1hFUjoKPiA+ID4gICAgICAgICAgICAgICAgIHJldHVybiBQ
RVJGX1JFR19QT1dFUlBDX1hFUjsKPiA+ID4gKyAgICAgICBjYXNlIFVOV19QUEMzMl9OSVA6Cj4g
PiA+ICsgICAgICAgICAgICAgICByZXR1cm4gUEVSRl9SRUdfUE9XRVJQQ19OSVA7Cj4gPiA+ICAg
ICAgICAgZGVmYXVsdDoKPiA+ID4gICAgICAgICAgICAgICAgIHByX2VycigidW53aW5kOiBpbnZh
bGlkIHJlZyBpZCAlZFxuIiwgdW53X3JlZ251bSk7Cj4gPiA+ICAgICAgICAgICAgICAgICByZXR1
cm4gLUVJTlZBTDsKPiA+ID4g4qyiIFthY21lQHRvb2xieCBwZXJmLXRvb2xzLW5leHRdJAo+Cj4g
PiA+IE9rPyBJdCB3YXMgdGhlIG9ubHkgaXNzdWUgZm91bmQgaW4gdGhpcyBwYXRjaC4KPgo+ID4g
TG9va3MgZ29vZCwgdGhlIE5JUCBpcyBpbiB0aGUgb3JpZ2luYWwgY29kZSB0aGF0IEkgY29waWVk
LCBzbyBJIGRvbid0Cj4gPiB1bmRlcnN0YW5kIGhvdyBJIGxvc3QgdGhpcywgYnV0IGdvb2QgY2F0
Y2ghCj4KPiBXaGF0IEkgaGF2ZSBpcyBpbiB0bXAucGVyZi10b29scy1uZXh0LCBkb2luZyBhIGNv
bnRhaW5lciBidWlsZCBub3csCj4gc3RpbGwgbmVlZCB0byBsb29rIGF0IHRoZSBvdGhlciBmaW5k
aW5ncywgYnV0IHRoZXkgc2VlbXMgZWl0aGVyIHRyaXZpYWwKPiBvciBjb21wbGFpbnRzIGFib3V0
IG1ha2luZyAgdGhlIGJ1aWxkIHRpbWUgbW9yZSBpbm5lZmljaWVudCBieSBub3QKPiBjYWNoaW5n
IHNvbWUgZmVhdHVyZSB0ZXN0cywgc28gSSB0aGluayBJJ2xsIGZpeCB0aGUgdHJpdmlhbCBsaWtl
IEkgZGlkCj4gaW4gdGhlIGFib3ZlIGNhc2UgKHBvc3RpbmcgZGlmZnMgdG8gdGhlIGxpc3QpIGFu
ZCBsZWF2ZSB0aGUgYnVpbGQgdGltZQo+IGZvciBsYXRlciBzbyB0aGF0IHdlIG1ha2UgcHJvZ3Jl
c3MuCj4KPiBXaWxsIHRyeSB0byBkbyB0aGlzIGxhdGVyIHRvZGF5IHNvIHRoYXQgSSBwdWJsaXNo
IGl0IHRvIHBlcmYtdG9vbHMtbmV4dAo+IGZvciBpdCB0byBzb2FrIGEgYml0IGluIGxpbnV4LW5l
eHQuCgpUaGlzIGlzIGdyZWF0ISBUaGFuayB5b3UgQXJuYWxkbyEKSWFuCgo+IC0gQXJuYWxkbwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
