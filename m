Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7FAEB7EA0
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 08:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R1f0PaNOWShRFDjWyxRQOyID5gbve951r2RBcmDO9a4=; b=sgesXgz2GI+5Zj
	EJqB4s4Vg6nYoGkdhZqUu0bz5MOk/MyOZnzQTdRbc0gppje2hgu/sscjUkD0rvr9kIYTs4KLh/TfF
	WFXGxAC8e2qWxbff0hPnGZwOK/lt6yIwNsQPrE30Rr8ZbPz00BwxHsmwQx9uH9S5CbwsacIHh3W89
	nuhUlrbeJd98w2EkQ1WRsFr7v74FyjPbU3ibtlgWbOKIYXTY9/lO6LZulNHpp/cyP1D4fappMbemC
	wzbslPoaS1Ig6uXRPj/IGpdgKfPmwJcJxA8ccARBRJv3MamPU/a5gA+CKmkhx2R+SkW1M/mxEmfrJ
	u4cLy6mYQuRL+RIhdxNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhJm-0000000GiCR-2mlm;
	Wed, 04 Mar 2026 08:10:54 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhJk-0000000GiBR-0V0n
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 08:10:53 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-79801df3e42so82687957b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 00:10:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772611851; cv=none;
        d=google.com; s=arc-20240605;
        b=U5ZKcR5dkKioGnVYI34Z6PONN8l4VXJzXxvi5h6ZETDNvReGR34MkGi/L0TFlS2gZX
         hDtB4JxCsPw3fDJY51S2eF2cpmd0gQcvVIW6eqm86RrIpOuW0cT5/foH/pEuWEm0gl20
         sy+6UCeT64rgGqGFauBZ3mZEdHn9ILRllvSCiJ6IauzBEXSIH9SYQ6Akdbj3P7IUK1Ou
         if79mjj91Xk39wZPKIZShd3PgoFnUqDybCG5lHam9ix5v+0fvPEGx8IaeSKAmV2FLKED
         I9QuU+uMnWpzl1I1/TsBwIIXtBYSk36xyFOfrqNVV2195KrzpRduks5P0fVSmiTUHU9G
         4Wow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xGLcah51hQA85jyOrvUCy/8RViW2Ks3it80HDo6IDSc=;
        fh=g/eubkKqdvMtvz3d1v2RJmhDSXbGVt06GYZxzcIkFBI=;
        b=EcW7sqpb96FDeHfri7OniNwFE8+9Twov4gtfI/W68yY/7hoY011gtzVlSKuEJrRkzl
         XqULZXI64EHsPSjWIsWOr6/5ciuEt00aujaYBFvqAYuLuj/ws+itA8IzZ8pGJyz8/eAW
         Lo7VO2it5yEK9zNglsYOj/fvpiGZwCT50Cua6g/eZyjcpVwpb7ZojPdf8N8Wk4c47peC
         yRZbaEJ6O6Z2XgMcYQJ7EQei1Fww/WylsjH3ES7alrh7EoSCTC8iaVWX2lap78fecazM
         pzVIfO/f8sJ5rF2ginH+pFvg8/65AaOpd2dU13fFoQguhSxKfojpV5lzuDCXoUuuvZJd
         4nrQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772611851; x=1773216651; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGLcah51hQA85jyOrvUCy/8RViW2Ks3it80HDo6IDSc=;
        b=KZjqSC+klNEJzns2684SHzwmxYQTncrh4lUK6lUl48pMHdp0ivsBlH6wpXc3LbxrpG
         rSsvInKLRKtl7RjfoJ1zWF7Ece7Sxn3UnEV3TDalyIpFo2oVNDYPVVOd6ITh+wk6ciO9
         Q276/6qXoTyCLKyuAnfSIbkcGRSEOOpKvsXEMBfiEfntl22xi7BPM1XNMtib9aF3xRd7
         HvAr8m4bJmiT+vnZqjU56L4WkAzq0y0A0H3Mqxy6goD54VBd6kYTVl+m/QTqlJLrueL+
         5UYrVgNxEm6VfgIGJf7DheXDm0fnJaBaF/fm5m4ZWIn2pd913IvyNNJmuPGsoMhCznPF
         RyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611851; x=1773216651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xGLcah51hQA85jyOrvUCy/8RViW2Ks3it80HDo6IDSc=;
        b=RauOfGKSQsX+5mfqW5Qbd071wo6Woy3GSoJ6L1m9HfUukf+ZX8qbtYUtkQeRs+RXqE
         CkSSK2C0hcUrGMq7kpneoDVZ1B06IU9QGS3H9uewk4I4WUThqVsg7/pYfqemaeun9OW0
         r3fychBHGB+Ao4h0bkco7V3NqaqXvHx6/IqoB7M2ikU7zviPDKH4OyMo0G94NduUwhZ0
         KquuyFFODAKOTms8LT8nZ0Ce05OD0mnOH4NQxKAcDWiqKSrX8NcFNzBAVuAPLqeqIVdE
         dyyXPT3GS4nc+dgOcyWQqjxLByDHNHyLNqs1AJhrICk++0SrOvmP33iq0LnSasfIL9gR
         6d1A==
X-Forwarded-Encrypted: i=1; AJvYcCXzl0i2I7ylRcHnfaGr/uAh+ANhkwCOu8Yrqu2Dz0bqkRk2UVwy+npypT3yYMo/CCYY2sLK7sQEG7UsLA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8g9AuZ5nKDHwBmMZ6EygmIPlb9eP9sQ1jhtEKvU2UWkP91pt6
	DhR8yn4qIdoX9xra+VuRnNPsM9g//cIWPkV6oZFMzjpd7rdLg4RBvLap7mQ2skSkAa8RXuwiUAB
	jhhUZlCi4V2+cCflfwcYzyrIszPQJuSc=
X-Gm-Gg: ATEYQzxgc0k7KNe7+/56wbmB2OJIVGiC00cYr0m7GJV+nEaNKqeUMRpE+zbhYgoB5R2
	MqosFtAigycWEXGJTnpNfa3ArouCtoSDaqVEirrDI/+xocZv/HmC41an8MzmhK6YtE9ZxBd/Rj7
	51PzgBpwCqBaJlcFik1v7VUrShuM65kH6Pc7CQeQuCL8teHzyhbNOLUEichFSmuv9t4nODJZ94f
	GOsg6yM7dEDC7HhQifDvFCmuE0lI21GPZ/ourG+mbWlLPLxkXUIZ06sWlAbvCUo8qgT5/Mh+Y8q
	N9i3pCLB
X-Received: by 2002:a05:690c:9a90:b0:794:c283:5fb8 with SMTP id
 00721157ae682-798bb44f72cmr33135687b3.25.1772611850798; Wed, 04 Mar 2026
 00:10:50 -0800 (PST)
MIME-Version: 1.0
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
 <20260302-orangepi-sd-card-uhs-v1-1-89c219973c0c@gmail.com>
 <20260302-crewman-faster-9fd00b62e30c@spud> <20260302223803-GKB289813@kernel.org>
 <CABdCQ=Nd9ZW6OBnAiuki=2+DhVraW19bh_m8=LLQGUKN8TkEdQ@mail.gmail.com> <20260303222800-GKC289813@kernel.org>
In-Reply-To: <20260303222800-GKC289813@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 4 Mar 2026 09:10:39 +0100
X-Gm-Features: AaiRm53WZ82ezbm0-nMVrOL-p2i2zBrqno2q7oSRqZHnhzqczyjmu4JOpaAlYaQ
Message-ID: <CABdCQ=OxA4RM+3Kqjim9QPUQD3xBkAjUTD+ObC5Cmux1Mx1UpQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] dt-bindings: mmc: spacemit,sdhci: add AIB voltage
 switching registers
To: Yixun Lan <dlan@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@gentoo.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_001052_167266_5F23CCEC 
X-CRM114-Status: GOOD (  14.77  )
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

RWwgbWFyLCAzIG1hciAyMDI2IGEgbGFzIDIzOjI4LCBZaXh1biBMYW4gKDxkbGFuQGtlcm5lbC5v
cmc+KSBlc2NyaWJpw7M6Cj4KPiBIaSBJa2VyLAo+Cj4gT24gMTQ6NTEgVHVlIDAzIE1hciAgICAg
LCBJa2VyIFBlZHJvc2Egd3JvdGU6Cj4gPiBFbCBsdW4sIDIgbWFyIDIwMjYgYSBsYXMgMjM6Mzgs
IFlpeHVuIExhbiAoPGRsYW5Aa2VybmVsLm9yZz4pIGVzY3JpYmnDszoKPiA+Cj4gPiBUaGFua3Mg
Zm9yIHRoZSBwb2ludGVyISBJIG1pc3NlZCB0aGF0IHRoZXNlIGhhZCBhbHJlYWR5IGxhbmRlZCBp
bgo+ID4gbWFpbmxpbmUuIEknbGwgcmViYXNlIHRoZSBzZXJpZXMsIGRyb3AgdGhlIHJlZHVuZGFu
dCBwcm9wZXJ0aWVzIGFuZAo+ID4gcGF0Y2ggWzUvMTBdLCBhbmQgc2VuZCBhIHYyIHNob3J0bHku
Cj4gPgo+IFBsZWFzZSB3YWl0IGEgbGl0dGxlIGJpdCBsb25nZXIgYmVmb3JlIHNlbmRpbmcgbmV4
dCB2ZXJzaW9uLCBnaXZlIG1lIG9yCj4gb3RoZXIgcGVvcGxlIG1vcmUgdGltZSBmb3IgcmV2aWV3
aW5nLCBhcyBhIHF1aWNrIHRlc3QsIHRoaXMgc2VyaWVzIHdpbGwKPiBicmVhayBlbW1jIGRyaXZl
ciBhcyB0ZXN0ZWQgb24gYmFuYW5hcGktZjMgYm9hcmQsIEkgc3VzcGVjdCBpdCdzIHByb2JhYmx5
Cj4gZHVvIHRvIGNsb2NrIHJlbGF0ZWQgaXNzdWUsIGJ1dCB3YW50IHRvIGNvbmZpcm0gbGF0ZXIu
LgoKVGhhbmtzIGZvciB0aGUgaGVhZHMtdXAuIEknbGwgd2FpdCBmb3IgeW91ciBmdXJ0aGVyIHJl
dmlldyBhbmQgdGhlCnJlc3VsdHMgb2YgeW91ciBjbG9jayB0ZXN0cyBvbiB0aGUgYmFuYW5hcGkt
ZjMuCgo+Cj4gQnR3LCBJIHdhcyBhbHNvIHByZXBhcmluZyBzZCBwYXJ0IGRyaXZlciwgbWFpbmx5
IHRhcmdldCBLMyBTb0MsIGJ1dCBzaW5jZQo+IHRoZXkgYXJlIG1vc3RseSBzYW1lIElQLCB0aGUg
ZHJpdmVyIGNhbiBiZSBzaGFyZWQuLgoKSSdtIGFsc28gaW50ZXJlc3RlZCBpbiB0aGUgSzMgU29D
IGludGVncmF0aW9uLiBTaW5jZSBpdCdzIHRoZSBzYW1lIElQLAppdCBtYWtlcyBzZW5zZSB0byBo
YXZlIGEgdW5pZmllZCBkcml2ZXIuIFBsZWFzZSBsZXQgbWUga25vdyB5b3VyCnRob3VnaHRzIG9u
IHRoZSBiZXN0IHdheSB0byBjb29yZGluYXRlIG91ciBlZmZvcnRzLgoKPgo+IC0tCj4gWWl4dW4g
TGFuIChkbGFuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
