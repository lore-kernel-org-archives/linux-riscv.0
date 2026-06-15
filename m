Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43222CD98DA
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 17:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b02fF4N85FSIkJ0LZ320gCBKvaj+uVANYykrCpZO7EI=; b=GUqLU5Brfvn1W4
	sgC1kE77/p+jbRK0wGTTPVsExeJjXCKf6OJFhjDUpLdjPpBxDbEY/TKuW22E+LpKlxpWn31T8e5sa
	4d+pr4MMQOLAhNIZJJzc4syJB+8J21x1opmJgrcGYGxej3BPAv9tpSP/Zqh/VtgZTKPqatwUvExcF
	uDwXwU16Hz0HGe471qKn7JMfAzx42ARb3aEptk+b5q+73SQmWiBSe1JBMFHUWTnhZfiiNB1AtUfaK
	hfimLneksnT10UO18Rqp1tN2uN/AtQjneHsNMVMRbTNG4pcaSRfv90EpYXaRaZGe7bkPgGBVzE+EK
	8UzY/cqRqnULjjVeW2zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZB1E-0000000Ee7S-0zM8;
	Mon, 15 Jun 2026 17:22:40 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZB17-0000000Ee5q-42H5
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 17:22:38 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-7e8833c99fcso39230017b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jun 2026 10:22:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781544152; cv=none;
        d=google.com; s=arc-20240605;
        b=a/loDmKNFsSLnABvZcKVtSmjPny3dNlaKXai2U8BnDRgUkKmOr0C4WryZwZdFMCqtr
         KPQs/8Xyn1pL3OevMxzBwEEw4tfJa60t6Uvo2sExnb7Nwx5eo+WVDuslLs+DYgWefnyX
         Dyt3jjFjT/TLPsv6XUyiPPcE5ZOz3ifjo3QiljIvdWYqeVXOXhY8qw3Zzj+qcLnSL821
         fjIzFcDq395Pq3uOJjFLImQu8b+fOANXfLEVHNZXR3mxZ+iaJYA85FFDXvOx89tp/noL
         XmjFA0k0qgodWv8im4wPJ+8RF2enjAZ5LZAmeatH4w0yeuXWl9TWmGmcZlPGSA7/tH1N
         J1qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uzRIzIU5mx5IXQLPHn96E0K8ToWMW+Q/L7YN2uSzC24=;
        fh=9Bvkju77ccjgib1GxtvwVAZlPNvm5iq2DLLzGGnexc8=;
        b=Q5RiXkJQ1zMvUKbMXRaJOTJto9yfHOzNURhLW38H23Eb27HBALCz7g54XihXnomA7o
         TsotGL7GdRnCW/AR5SPaGNfaJtiVkYppVv6O8aDIVvJhPbHm5+qe7f7Y8ftJruwpF5hn
         WManDTtmzfgqFxvLEfg+flKKCoyZPsCguJgNKRVFcGooU4l//n4S0qbXYxJ8r/8Eg7Xf
         +jDZ7xugz3FNWNJTd2SxigK0wuAda3oRyEgkIu4l0gt495LjAFZoJOCBjXZcUgGZQfwm
         0coePC9/jtxbtWXNtDiHrUB+/kZp8VHjox3/LTZiuj9fT/a6apK4ceAJl6DriWRPwNuB
         wDeg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1781544152; x=1782148952; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzRIzIU5mx5IXQLPHn96E0K8ToWMW+Q/L7YN2uSzC24=;
        b=BWiHOKYvRJEKD8ZIeLJcPY9pSWyABHR0gKBDwbl4OsIdmRVjmpS5Bf0rgbftBeB6NK
         nqQzEmprWcrgE1Chub1Fi0Mbf0/uPSrV2BNKANllN8R0fxHLhhDer3D8T4TSSAkfK3Jk
         tWJLrSyE/vqe1ZUWHWdo0YZvyfgoY+mRhorC/4k8qGKm2VTS6iIKFJosnxJ4D02CPdPU
         L+NLcf7HLgzNILuukmgmGstW8D/zdK3PF/REQ+WCFHm5GojC22o6Mor6HK86zGOPNM9Q
         1X0QLRHZZSWPj8oBvPhUKPdQ6nbn2Xq6/hklkaiW8BStWsM0gFrabCFVyUE+yCrTV+tt
         Rd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781544152; x=1782148952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uzRIzIU5mx5IXQLPHn96E0K8ToWMW+Q/L7YN2uSzC24=;
        b=oP+7CZfpDd/zPRjLdJ177HGaUmFFO9V0Dfa6bnc0w9Yw5RANk3s1kr+wWKO2s+eP37
         SfzcBYs8whZFJa0RtS+25CL7Q7fzRxVnU/8zdVDYZ8JaeQPGEikAUfdx1oC2qDBUoN37
         1JnFFZjiMYXLI7pYebPsjtJFoMyxLusDzNO9Y1G3D/LihiopR3VEnNnN4ZwsoLk+LwQN
         1jgxd97Nm29Wq3KC6w5FdgD+/KEXyeKI/xUvEgKoyC0TZAlo9606CxANsno0Cm9BoZ2J
         me59qANwh7CBZLDk4jm4eCsmIrfgSN/IOPJDYu8suAetSkP6rrzWC1j2W/lMU9gd58hp
         lSmg==
X-Forwarded-Encrypted: i=1; AFNElJ8GPHm93w5P4wEADS9LutG2b80Kx5N4KsR7/t0MXTaMjypPwq/f9p/PEaxWZodn+cByrK23xT4nainSYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDf0c9aoPjR4HR/VSZVXmZCgUPL/QLQ7SqzDdwzVqDKlWpuqVB
	bTZ0dmePdqF2h17DbOvshS9BdJPQSbEkndhTDtBcWJKNJ+MgHZH6aV9SZ3RpeB2nvY0Nl+s17Sd
	/pJt4hSHtp+paxfDTjYrapKNBz4KpObgacBLcTB3yaFtAtnaL0akSRME=
X-Gm-Gg: Acq92OFIWba+sIxkzHz3voMgOT8BerXmhHwoMHTPYefpzsZ1j77Erk4buGX+4CvNajD
	0f4oZ4zWI/AKYgBlP/K/chh+uXLyN5XIR0JVxR4zYzZIas+3PEbWOVTgXNkhskqtZ3suhzvs4wp
	w7easOXtdJHJWMrW/FPyprTHNLlDs351idDMR/HFZQ0bCL07/IizjAjyCg/SPOo0RQPa3LoB1tw
	TzKyYQVLx9T8e1AJgVS8jvg5zlLqi+qGYuPoCmc5P9SpF6MiWAHEm1Dp72ylEAn02g8DonWuzZg
	xyZRzbg4B9/crXei2NJFA3pZ5gdeLByxYe9TMVKRsdfUNm4P
X-Received: by 2002:a05:690c:260e:b0:7bd:9f34:59a0 with SMTP id
 00721157ae682-7f7bcf107b8mr154307467b3.23.1781544151547; Mon, 15 Jun 2026
 10:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260612-vec_unaligned_drop_init-v1-1-df969210ae34@oss.tenstorrent.com>
 <87ecibwiz6.fsf@yellow.woof>
In-Reply-To: <87ecibwiz6.fsf@yellow.woof>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 15 Jun 2026 12:22:18 -0500
X-Gm-Features: AVVi8Cci91L-oOciJ85aCn5MeUTNpVdDOXh0tmPUisOe9q_9MlZHrp6phc7Q8FQ
Message-ID: <CAEev2e8AH8W_M4=9N8vLJyvRqwGG=p8O-jVa7tdM3LjCRj=6aw@mail.gmail.com>
Subject: Re: [PATCH] riscv: drop __init from vec_check_unaligned_access_speed_all_cpus
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, andrew.jones@oss.qualcomm.com, 
	ganboing@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_102234_191747_B877C9EC 
X-CRM114-Status: GOOD (  34.24  )
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

SGksCgpPbiBGcmksIEp1biAxMiwgMjAyNiBhdCA0OjIz4oCvUE0gTmFtIENhbyA8bmFtY2FvQGxp
bnV0cm9uaXguZGU+IHdyb3RlOgo+Cj4gQW5pcnVkaCBTcmluaXZhc2FuIDxhc3Jpbml2YXNhbkBv
c3MudGVuc3RvcnJlbnQuY29tPiB3cml0ZXM6Cj4gPiBUaGlzIGZ1bmN0aW9uIHJ1bnMgd2l0aGlu
IGEga3RocmVhZCBhbmQgbmVlZCBub3QgbmVjZXNzYXJpbHkgZmluaXNoCj4gPiBiZWZvcmUgc3lz
dGVtIGZpbmlzaGVzIGJvb3QgYW5kIGZyZWVfaW5pdG1lbSgpIHVubWFwcyB0aGUgLmluaXQudGV4
dAo+ID4gc2VjdGlvbi4gVGhpcyBmdW5jdGlvbiBtYWtlcyBjYWxscyB0byBTQkkgZm9yIHByb2Jp
bmcgdW5hbGlnbmVkIGFjY2Vzcwo+ID4gc3BlZWQsIGFuZCBpZiB0aGlzIGlzIHNsb3cgZm9yIHNv
bWUgcmVhc29uIChzYXkgc29tZSBkZWJ1ZyBwcmludHMgd2VyZQo+ID4gYWRkZWQgdG8gU0JJKSwg
dGhlIGt0aHJlYWQgY2FuIHN0aWxsIGJlIHJ1bm5pbmcgYXQgdGhpcyBwb2ludCBhbmQgcmVzdWx0
Cj4gPiBpbiBhbiBpbnN0cnVjdGlvbiBwYWdlIGZhdWx0IHdoZW4gdHJ5aW5nIHRvIGZldGNoIGZy
b20gdGhlIGZyZWVkIHJlZ2lvbi4KPiAuLi4KPiA+IERyb3AgX19pbml0IGZyb20gaXRzIHNpZ25h
dHVyZSBzbyB0aGF0IHRoaXMgZG9lc24ndCBoYXBwZW4uCj4KPiBUaGF0IHNob3VsZCB3b3JrLgo+
Cj4gQnV0IHdlIHNob3VsZCByZWFsbHkgdGFrZSBhIHN0ZXAgYmFjayBhbmQgcmVjb25zaWRlciB3
aGV0aGVyIHJ1bm5pbmcgdGhlCj4gdmVjdG9yIGFjY2VzcyBzcGVlZCBwcm9iZSBpbiBhIGt0aHJl
YWQgaXMgcmVhbGx5IGEgZ29vZCBpZGVhLgo+Cj4gV2UgaGF2ZSBhIHByb2JsZW0gaW4gdGhlIHBh
c3QgdGhhdCB0aGUga3RocmVhZCBtYXkgbm90IGNvbXBsZXRlIGJlZm9yZQo+IHVzZXIgcmVhZHMg
dmRzbywgYW5kIHVzZXIgZ2V0cyBpbmNvcnJlY3QgdmFsdWVzLiBUaGF0IHdhcyBhZGRyZXNzZWQg
YnkKPiA1ZDE1ZDJhZDM2YjAgKCJyaXNjdjogaHdwcm9iZTogRml4IHN0YWxlIHZEU08gZGF0YSBm
b3IgbGF0ZS1pbml0aWFsaXplZAo+IGtleXMgYXQgYm9vdCIpIHdoaWNoIGNvbXBsaWNhdGVzIHRo
aW5ncy4KPgo+IEFuZCBub3cgeW91IGRpc2NvdmVyIGFub3RoZXIgaXNzdWUuCj4KPiBUaGUgbW90
aXZhdGlvbiBmb3IgdXNpbmcgYSBrdGhyZWFkIGlzIHRvIGF2b2lkIGJvb3QgdGltZSBzbG93IGRv
d24uIEJ1dAo+IHRoaXMgaGFzIGJlZW4gYm90aGVyaW5nIG1lIGZvciBxdWl0ZSBhIHdoaWxlIG5v
dywgYmVjYXVzZSBJIGFtIG5vdCBzdXJlCj4gaWYgdXNpbmcga3RocmVhZCByZWFsbHkgc3BlZWRz
IHRoaW5ncyB1cC4gU29vbmVyIG9yIGxhdGVyLCB0aGUga3RocmVhZAo+IGhhcyB0byBydW4uIElm
IGl0IHJ1bnMgYmVmb3JlIHRoZSBrZXJuZWwgaXMgZG9uZSBib290aW5nLCB0aGVuIHRoZSBib290
Cj4gaXMgZXZlbiBzbG93ZXIgZHVlIHRvIG92ZXJoZWFkIG9mIHRoZSBrdGhyZWFkLiBJZiBpdCBy
dW5zIGFmdGVyIHRoZQo+IGtlcm5lbCBmaW5pc2hlcyBib290aW5nLCB0aGVuIHdlIHJ1biBpbnRv
IHRoZXNlIGtpbmRzIG9mCj4gaGVhZGFjaGUuIFVuZm9ydHVuYXRlbHkgSSBkbyBub3QgaGF2ZSBh
IHJpc2N2IGNwdSB3aXRoIHZlY3RvciB0byBjb25maXJtCj4gbXkgc3VzcGljaW9uLgo+Cj4gRnVy
dGhlcm1vcmUsIHRoZSB2ZWN0b3IgYWNjZXNzIHNwZWVkIHByb2JlIHRha2VzIHRoZSBzYW1lIGFt
b3VudCBvZiB0aW1lCj4gYXMgc2NhbGFyIGFjY2VzcyBzcGVlZCBwcm9iZS4gVGhlIHNjYWxhciBv
bmUgaXMgZG9uZSB3aXRob3V0IGFueQo+IGt0aHJlYWQsIGFuZCBubyBvbmUgZXZlciBjb21wbGFp
bmVkIGFib3V0IGJvb3QgdGltZSBpc3N1ZSAod2VsbCwgc29tZW9uZQo+IGRpZCBjb21wbGFpbiBi
dXQgdGhhdCBoYXMgbm90aGluZyB0byBkbyB3aXRoIGt0aHJlYWQuIFRoZWlyIDY0LWNvcmUgKD8p
Cj4gc3lzdGVtIGlzIHNsb3dlciBiZWNhdXNlIHRoZSBwcm9iZSB3YXMgZG9uZSBzZXJpYWxseSwg
YW5kIHdlIHN3aXRjaGVkIHRvCj4gcGFyYWxsZWwgcHJvYmUgYW5kIGl0IHdhcyBmaW5lKS4KPgo+
IFNvIEkgdGhpbmsgd2Ugc2hvdWxkIHJlYWxseSBnZXQgcmlkIG9mIHRoYXQga3RocmVhZCBlbnRp
cmVseSwgdGhlCj4gaGVhZGFjaGUgaXMgbm90IHdvcnRoLiBUaGF0IGFsc28gYWxsb3dzIHJldmVy
dGluZyA1ZDE1ZDJhZDM2YjAgKCJyaXNjdjoKPiBod3Byb2JlOiBGaXggc3RhbGUgdkRTTyBkYXRh
IGZvciBsYXRlLWluaXRpYWxpemVkIGtleXMgYXQgYm9vdCIpLCBtYWtpbmcKPiB0aGUgY29kZSBz
aW1wbGllci4KPgo+IEJlbG93IGlzIGEgcGF0Y2ggdGhhdCBoYXMgb25seSBiZWVuIHRlc3RlZCB3
aXRoIHFlbXUuIEl0IHJldmVydHMgdGhlCj4gbWVudGlvbmVkIGNvbW1pdCBhbmQgcmVtb3ZlcyB0
aGUga3RocmVhZC4KPgoKSSB0ZXN0ZWQgeW91ciBwYXRjaCBvbiBTaWZpdmUgWDI4MCAoUlZWIDEu
MCwgVmxlbiA1MTIpIGFuZCBhIHBhdGNoZWQKdmVyc2lvbiBvZiBRZW11IChxZW11IGRvZXNuJ3Qg
ZW1pdCB0cmFwcyBvbiBtaXNhbGlnbmVkIHZlY3Rvcgpsb2FkL3N0b3Jlcywgc28gSSB0cmllZCBw
YXRjaGluZyBpdCB0byBkbyB0aGF0KSBhbmQgaXQgc2VlbXMgdG8gZml4IG15CmVycm9yIGluIGJv
dGggY2FzZXMuCgpOb3Qgc3VyZSBpZiB0aGlzIGlzIHVzZWZ1bCBpbmZvIGFib3V0IGJvb3QgdGlt
aW5ncyBvbiB0aGUgWDI4MCwgYnV0CgpCZWZvcmUgeW91ciBwYXRjaCAodmVjX2NoZWNrX3VuYWxp
Z25lZF9hY2Nlc3Nfc3BlZWRfYWxsX2NwdXMgcnVucyBpbiBrdGhyZWFkKQpbICAgIDAuMzkzMDI5
XSBjcHUxOiBzY2FsYXIgdW5hbGlnbmVkIHdvcmQgYWNjZXNzIHNwZWVkIGlzIDAuMDF4IGJ5dGUK
YWNjZXNzIHNwZWVkIChzbG93KQpbICAgIDAuMzkzMDM1XSBjcHUyOiBzY2FsYXIgdW5hbGlnbmVk
IHdvcmQgYWNjZXNzIHNwZWVkIGlzIDAuMDF4IGJ5dGUKYWNjZXNzIHNwZWVkIChzbG93KQpbICAg
IDAuMzkzMDM3XSBjcHUwOiBzY2FsYXIgdW5hbGlnbmVkIHdvcmQgYWNjZXNzIHNwZWVkIGlzIDAu
MDF4IGJ5dGUKYWNjZXNzIHNwZWVkIChzbG93KQpbICAgIDAuMzkzMDUxXSBjcHUzOiBzY2FsYXIg
dW5hbGlnbmVkIHdvcmQgYWNjZXNzIHNwZWVkIGlzIDAuMDF4IGJ5dGUKYWNjZXNzIHNwZWVkIChz
bG93KQpbICAgIDAuNDE3OTMyXSBjcHUyOiB2ZWN0b3IgdW5hbGlnbmVkIHdvcmQgYWNjZXNzIHNw
ZWVkIGlzIDAuMDB4IGJ5dGUKYWNjZXNzIHNwZWVkIChzbG93KQpbICAgIDAuNDE3OTM3XSBjcHUw
OiB2ZWN0b3IgdW5hbGlnbmVkIHdvcmQgYWNjZXNzIHNwZWVkIGlzIDAuMDB4IGJ5dGUKYWNjZXNz
IHNwZWVkIChzbG93KQpbICAgIDAuNDE3OTU4XSBjcHUxOiB2ZWN0b3IgdW5hbGlnbmVkIHdvcmQg
YWNjZXNzIHNwZWVkIGlzIDAuMDB4IGJ5dGUKYWNjZXNzIHNwZWVkIChzbG93KQpbICAgIDAuNDIy
MTc1XSBjcHUzOiB2ZWN0b3IgdW5hbGlnbmVkIHdvcmQgYWNjZXNzIHNwZWVkIGlzIDAuMDF4IGJ5
dGUKYWNjZXNzIHNwZWVkIChzbG93KQpbICAgIDAuNDIzNzgwXSBjbGs6IERpc2FibGluZyB1bnVz
ZWQgY2xvY2tzClsgICAgMC40MjcxODVdIFBNOiBnZW5wZDogRGlzYWJsaW5nIHVudXNlZCBwb3dl
ciBkb21haW5zClsgICAgMC40NTg4MDFdIEVYVDQtZnMgKHZkYSk6IHJlY292ZXJ5IGNvbXBsZXRl
ClsgICAgMC40NTkwNjldIEVYVDQtZnMgKHZkYSk6IG1vdW50ZWQgZmlsZXN5c3RlbQoyYzg4YzVi
NC1mMjY5LTRiMDQtYTRjNC0yZTcyNzBjNTM5MTkgci93IHdpdGggb3JkZXJlZCBkYXRhIG1vZGUu
IFF1b3RhCm1vZGU6IGRpc2FibGVkLgpbICAgIDAuNDU5MTQ2XSBWRlM6IE1vdW50ZWQgcm9vdCAo
ZXh0NCBmaWxlc3lzdGVtKSBvbiBkZXZpY2UgMjU0OjAuClsgICAgMC40NjE5ODFdIGRldnRtcGZz
OiBtb3VudGVkClsgICAgMC40NjIxMDFdIFZGUzogUGl2b3RlZCBpbnRvIG5ldyByb290ZnMKWyAg
ICAwLjQ2NDM3N10gRnJlZWluZyB1bnVzZWQga2VybmVsIGltYWdlIChpbml0bWVtKSBtZW1vcnk6
IDIyNjRLClsgICAgMC40NjQ0NzRdIFJ1biAvc2Jpbi9pbml0IGFzIGluaXQgcHJvY2VzcwoKQWZ0
ZXIgeW91ciBwYXRjaCAodmVjX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfYWxsX2NwdXMg
ZG9lc24ndApydW4gaW4ga3RocmVhZCkKWyAgICAwLjM5MzAyNl0gY3B1MDogc2NhbGFyIHVuYWxp
Z25lZCB3b3JkIGFjY2VzcyBzcGVlZCBpcyAwLjAxeCBieXRlCmFjY2VzcyBzcGVlZCAoc2xvdykK
WyAgICAwLjM5MzAyN10gY3B1MTogc2NhbGFyIHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBzcGVlZCBp
cyAwLjAxeCBieXRlCmFjY2VzcyBzcGVlZCAoc2xvdykKWyAgICAwLjM5MzAyOV0gY3B1Mzogc2Nh
bGFyIHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBzcGVlZCBpcyAwLjAxeCBieXRlCmFjY2VzcyBzcGVl
ZCAoc2xvdykKWyAgICAwLjM5MzA1MF0gY3B1Mjogc2NhbGFyIHVuYWxpZ25lZCB3b3JkIGFjY2Vz
cyBzcGVlZCBpcyAwLjAxeCBieXRlCmFjY2VzcyBzcGVlZCAoc2xvdykKWyAgICAwLjQxNzc4MV0g
Y3B1MTogdmVjdG9yIHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBzcGVlZCBpcyAwLjAweCBieXRlCmFj
Y2VzcyBzcGVlZCAoc2xvdykKWyAgICAwLjQxNzc4NF0gY3B1MjogdmVjdG9yIHVuYWxpZ25lZCB3
b3JkIGFjY2VzcyBzcGVlZCBpcyAwLjAweCBieXRlCmFjY2VzcyBzcGVlZCAoc2xvdykKWyAgICAw
LjQxNzc5N10gY3B1MzogdmVjdG9yIHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBzcGVlZCBpcyAwLjAw
eCBieXRlCmFjY2VzcyBzcGVlZCAoc2xvdykKWyAgICAwLjQxNzgwM10gY3B1MDogdmVjdG9yIHVu
YWxpZ25lZCB3b3JkIGFjY2VzcyBzcGVlZCBpcyAwLjAweCBieXRlCmFjY2VzcyBzcGVlZCAoc2xv
dykKWyAgICAwLjQzMzk0NF0gY2xrOiBEaXNhYmxpbmcgdW51c2VkIGNsb2NrcwpbICAgIDAuNDMz
OTYyXSBQTTogZ2VucGQ6IERpc2FibGluZyB1bnVzZWQgcG93ZXIgZG9tYWlucwpbICAgIDAuNDQ2
NzMwXSBFWFQ0LWZzICh2ZGEpOiByZWNvdmVyeSBjb21wbGV0ZQpbICAgIDAuNDQ3MDcxXSBFWFQ0
LWZzICh2ZGEpOiBtb3VudGVkIGZpbGVzeXN0ZW0KMmM4OGM1YjQtZjI2OS00YjA0LWE0YzQtMmU3
MjcwYzUzOTE5IHIvdyB3aXRoIG9yZGVyZWQgZGF0YSBtb2RlLiBRdW90YQptb2RlOiBkaXNhYmxl
ZC4KWyAgICAwLjQ0NzEzNF0gVkZTOiBNb3VudGVkIHJvb3QgKGV4dDQgZmlsZXN5c3RlbSkgb24g
ZGV2aWNlIDI1NDowLgpbICAgIDAuNDUxNzE5XSBkZXZ0bXBmczogbW91bnRlZApbICAgIDAuNDUx
ODQwXSBWRlM6IFBpdm90ZWQgaW50byBuZXcgcm9vdGZzClsgICAgMC40NTU2NThdIEZyZWVpbmcg
dW51c2VkIGtlcm5lbCBpbWFnZSAoaW5pdG1lbSkgbWVtb3J5OiAyMjY0SwpbICAgIDAuNDU3OTkx
XSBSdW4gL3NiaW4vaW5pdCBhcyBpbml0IHByb2Nlc3MKCkkgdGhpbmsgdGhlIGRpZmZlcmVuY2Ug
c2VlbXMgdG9vIHNtYWxsIGhlcmUgdG8gZHJhdyBhbnkgY29uY2x1c2lvbnMuClRoaXMgaXMgb25s
eSBhIDQgY29yZSBDUFUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
