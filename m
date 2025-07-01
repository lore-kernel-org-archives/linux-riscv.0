Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B7CC83038
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 20:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IEWrHOEUJ0Z++TXQSWQsTe6OPGL3CRK2tFLJOFHdLRw=; b=E/ejdnZvZtjdi+
	CM5fKbGeqfNbuM39+DV40p+YHO36oBC8Kee1+S6buQEfHDdIF/m23kxTHFGOAfcrERRCVoR75GWt4
	v1txMqXON8wFpmwK81Fs9nfkKf9mTJTQdycBZZTHC3XcUuNCkxeNe8q4KBKvBWa18Xl1AyebQjy/6
	oP+Fv0vKOYygQIKeDkdNcmCNNqHBmVu8iYfHCZAKszsiK4oKCkOHTBkYMpsS3WqyiSaZJfNDKxuD1
	Yt6ES4S5vy2Zy73MxakA2PtmSc6KvEGVhQtTbteVmY0U0cSXyfVJ8ONpo3lbzD57GtLVPKE2CVCz4
	u4AqnKfyOd/i1sd8u+Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhwV-00000006cA3-0nhs;
	Tue, 01 Jul 2025 20:51:03 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfmF-00000006LQG-0oyB
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 18:32:20 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso3339237b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 11:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751394738; x=1751999538; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gY6mQVMmIl68dFLJH/SnrEytnvbgKUD06sOpURKt7zw=;
        b=ITBi94UsB8HLzGZ97VCPZWDkMAkBf5Ipiv+4xuPlLD+pALILqMCTswz9sY48Cjxe91
         dxnOYrDDwdZghVWEoN11zOS7rDBdP+sP7Uu+GnyLVrkxBdYlwUGq6f0n5BCoVLeZ85TJ
         m7jPMxA34WAbEdhbb1hzI+e0N5Bd+IU+2BkhwCJsLatAduC06277SZhfBDjDmIzl42ls
         Gq0mOFJHnHGrCT6LPjHI6JDA76e0z7se7kFLyOJEHHA++0zrodhzIRD7G9/kRypzx4HA
         1slM+yMUNojnKxSI0gubhu4WsueDqiuVGV4c1reryyFQ4xcwGgg2ubQvod4dc6pqutsh
         qQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751394738; x=1751999538;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gY6mQVMmIl68dFLJH/SnrEytnvbgKUD06sOpURKt7zw=;
        b=SqRQk2/U+Gdn7CPU6nQj4btkrjEq9LoNAo4v11o3sCiToSe5U1TsJWwCfLM4rFSdpv
         iH9r/5oNtAwiXUC9pusZc+HBif67T5B81T7nq9Pl65KxhqcPy9OIZ4U7wkrkfunDZwXM
         +4ZySYmmJtWUFbj3gELK/yqbVpWy1zRlf/7guair6OWCK/FhmYAVDEFeKvlO5FRoxfQG
         yBgLZKDYwjnuyzZVOZEkodw0KXOBxfdx2JIbZQeI7M8x2ci+6MOYzogiJtF82T2Tb48C
         y7Na2YntPB8q2vLHr3/yKG0S3YsNP1cUQBqFrpmLS/l7IixAC2UW68ujR3TtJl/Mj2FW
         CkXA==
X-Forwarded-Encrypted: i=1; AJvYcCVuYHeYX4VtZ3sQ7zAcmoAyyS6mbD7S5p6rZl39vksF0N0Njkdcl4pXJV43oRqjfyYpJ8Xg8MnmMfvzLw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0Rpg7Dxm8aIvKPv2iWiCoRJdsbTiANkYyy8CdtuXikre92VGs
	akmCVVdafOHggEUe0DOTmny4+v6g+JeTCZMAXDEgGJHlaj6pl2S3aora
X-Gm-Gg: ASbGnctnbps18wK3twva/tgzm6IqXdxIrCCUjFRtB3fu5FlKoNH5jEiQxEsSLjYO15D
	m66z7Xhm//Y12jJHkoo+DUd1N5WpLOrxlb5vI27dLpfkoCbwuhGq4EUAIB11wH9dEHa80UN5nmg
	wuGsE9UROCo20w0dIw7GpzSnPtiVrGEsSkrhMF3SaG3kdKEqq8Y+7TJg+Dx2TBck3UCKead8muA
	mg3ZcIAhfKqx4bbmgPKbyG6+XaZOu4krkwscnWTnb8CYgn6TpibYHyxLPLwMBO7nBYNuoQzQtP0
	Y7oCTKUQya0yhHLqQ1tOYLYMHqgz0VJsirH1BFqBdp3KHBUTNHl8ffk5I1QCSg==
X-Google-Smtp-Source: AGHT+IFHLL7P1lYF9UPZci0RSTG7Y6C/qYNbKwFfO//TmNisiNGsH7HgHOhmAuCFzDwIfvPTkGQc5Q==
X-Received: by 2002:a05:6a00:2e15:b0:732:2923:b70f with SMTP id d2e1a72fcca58-74af6f73b0emr24350576b3a.11.1751394737753;
        Tue, 01 Jul 2025 11:32:17 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55c6d49sm12327550b3a.119.2025.07.01.11.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 11:32:16 -0700 (PDT)
Date: Tue, 1 Jul 2025 14:32:14 -0400
From: Yury Norov <yury.norov@gmail.com>
To: cp0613@linux.alibaba.com
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, arnd@arndb.de,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux@rasmusvillemoes.dk,
	palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH 2/2] bitops: rotate: Add riscv implementation using Zbb
 extension
Message-ID: <aGQprv3HTplw9r-q@yury>
References: <aGLA78usaJOnpols@yury>
 <20250701124737.687-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250701124737.687-1-cp0613@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_113219_261668_D1778C3C 
X-CRM114-Status: GOOD (  33.33  )
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

T24gVHVlLCBKdWwgMDEsIDIwMjUgYXQgMDg6NDc6MDFQTSArMDgwMCwgY3AwNjEzQGxpbnV4LmFs
aWJhYmEuY29tIHdyb3RlOgo+IE9uIE1vbiwgMzAgSnVuIDIwMjUgMTI6NTM6MDMgLTA0MDAsIHl1
cnkubm9yb3ZAZ21haWwuY29tIHdyb3RlOgo+IAo+ID4gPiA+IDEuIFRoZSBtb3N0IHRyaXZpYWwg
Y29tcGlsZS1jYXNlIGlzIGFjdHVhbGx5IGV2YWx1YXRlZCBhdCBjb21waWxlIHRpbWU7IGFuZAo+
ID4gPiA+IDIuIEFueSBhcmNoLXNwZWNpZmljIGNvZGUgaXMgd2VsbCBleHBsYWluZWQ7IGFuZAo+
ID4gPiA+IDMuIGxlZ2FjeSBjYXNlIG9wdGltaXplZCBqdXN0IGFzIHdlbGwgYXMgbm9uLWxlZ2Fj
eS4KPiA+ID4gCj4gPiA+IDEuIEFzIGluIHRoZSBhYm92ZSByZXBseSwgdXNlIHRoZSBnZW5lcmlj
IGltcGxlbWVudGF0aW9uIHdoZW4gY29tcGlsZS10aW1lIGV2YWx1YXRpb24KPiA+ID4gICAgaXMg
cG9zc2libGXjgIIKPiA+ID4gMi4gSSB3aWxsIGltcHJvdmUgdGhlIGNvbW1lbnRzIGxhdGVyLgo+
ID4gCj4gPiBJJ20gcGFydGljdWxhcmx5IGludGVyZXN0ZWQgaW4gcm9yOC9yb2w4IGNhc2U6Cj4g
PiAKPiA+ICAgICAgICAgdTMyIHdvcmQzMiA9ICgodTMyKXdvcmQgPDwgMjQpIHwgKCh1MzIpd29y
ZCA8PCAxNikgfCAoKHUzMil3b3JkIDw8IDgpIHwgd29yZDsKPiA+IAo+ID4gV2hlbiB5b3UgZXhw
YW5kIGl0IHRvIDMyLWJpdCB3b3JkLCBhbmQgd2FudCB0byByb3RhdGUsIHlvdSBvYnZpb3VzbHkK
PiA+IG5lZWQgdG8gY29weSBsb3dlciBxdWFydGVyd29yZCB0byB0aGUgaGlnaGVyIG9uZToKPiA+
IAo+ID4gICAgICAgICAweGFiID4+IDB4YWIwMDAwYWIKPiA+IAo+ID4gVGhhdCB3YXkgZ2VuZXJp
YyAodTgpcm9yMzIoMHhhYiwgc2hpZnQpIHdvdWxkIHdvcmsuIEJ1dCBJIGRvbid0IHVuZGVyc3Rh
bmQKPiA+IHdoeSB5b3UgY29weSB0aGUgbG93ZXIgOCBiaXRzIHRvIGlubmVyIHF1YXJ0ZXJ3b3Jk
cy4gSXMgdGhhdCBhIGhhcmR3YXJlCj4gPiByZXF1aXJlbWVudD8gQ2FuIHlvdSBwb2ludCB0byBh
bnkgYXJjaCBkb2N1bWVudGF0aW9uIAo+ID4gCj4gPiA+IDMuIEFzIG1lbnRpb25lZCBiZWZvcmUs
IG9ubHkgOC1iaXQgcm90YXRpb24gc2hvdWxkIGhhdmUgbm8gb3B0aW1pemF0aW9uIGVmZmVjdCwg
YW5kCj4gPiA+ICAgIDE2LWJpdCBhbmQgYWJvdmUgd2lsbCBoYXZlIHNpZ25pZmljYW50IG9wdGlt
aXphdGlvbi4KPiA+IAo+ID4gSSBhc2tlZCB5b3UgYWJvdXQgdGhlIGFzbSBnb3RvICgibGVnYWN5
IikgdGhpbmc6IHlvdSBjYWxjdWxhdGUgdGhhdAo+ID4gY29tcGxleCB3b3JkMzIgX2JlZm9yZV8g
ZXZhbHVhdGluZyB0aGUgZ290by4gU28gdGhpcyB3b3JkMzIgbWF5IGdldAo+ID4gdW51c2VkLCBh
bmQgeW91IHdhc3RlIGN5Y2xlcy4gSSB3YW50IHRvIG1ha2Ugc3VyZSB0aGlzIGlzbid0IHRoZSBj
YXNlLgo+IAo+IFRoYW5rIHlvdSBmb3IgeW91ciBzdWdnZXN0aW9uIGFuZCByZW1pbmRlci4gVGhp
cyBpcyBub3QgYSBoYXJkd2FyZSByZXF1aXJlbWVudCwgYnV0IGl0CgpTdXJlLiBQbGVhc2UgYWRk
CgpTdWdnZXN0ZWQtYnk6IFl1cnkgTm9yb3YgKE5WSURJQSkgPHl1cnkubm9yb3ZAZ21haWwuY29t
PgoKPiBpcyBzb21ld2hhdCByZWxhdGVkIGJlY2F1c2UgdGhlIHpiYiBpbnN0cnVjdGlvbiBvbmx5
IHN1cHBvcnRzIHdvcmQtc2l6ZWQgcm90YXRlIFsxXS4KPiBDb25zaWRlcmluZyB0aGUgY2FzZSB3
aGVyZSB0aGUgc2hpZnQgaXMgZ3JlYXRlciB0aGFuIDgsIGlmIHRoZSBtb2R1bHVzIG9mIHRoZSBz
aGlmdCBpcwo+IG5vdCB0YWtlbiwgaXQgaXMgcmVxdWlyZWQgdG8gY29udGludW91c2x5IGNvbmNh
dGVuYXRlIDgtYml0IGRhdGEgaW50byAzMiBiaXRzLgo+IAo+IFNvLCBJIGNvbnNpZGVyZWQgdGhl
IGNhc2Ugb2YgdGFraW5nIHRoZSByZW1haW5kZXIgb2Ygc2hpZnQgYW5kIGZvdW5kIHRoYXQgdGhp
cwo+IGltcGxlbWVudGF0aW9uIHdvdWxkIGhhdmUgb25lIGxlc3MgaW5zdHJ1Y3Rpb24sIHNvIHRo
ZSBmaW5hbCBpbXBsZW1lbnRhdGlvbiBpcyBhcyBmb2xsb3dzOgo+IGBgYAo+IHN0YXRpYyBpbmxp
bmUgdTggdmFyaWFibGVfcm9sOCh1OCB3b3JkLCB1bnNpZ25lZCBpbnQgc2hpZnQpCgpOb3cgdGhh
dCBpdCBoYXMgYXNzZW1ibGVyIGlubGluZXMsIHdvdWxkIGl0IGhlbHAgdG8gYWRkIHRoZSBfX3B1
cmUKcXVhbGlmaWVyPwoKPiB7Cj4gCXUzMiB3b3JkMzI7Cj4gCj4gCWFzbSBnb3RvKEFMVEVSTkFU
SVZFKCJqICVsW2xlZ2FjeV0iLCAibm9wIiwgMCwKPiAJCQkJICAgICAgUklTQ1ZfSVNBX0VYVF9a
QkIsIDEpCj4gCQkJICA6IDogOiA6IGxlZ2FjeSk7Cj4gCj4gCXdvcmQzMiA9ICgodTMyKXdvcmQg
PDwgMjQpIHwgd29yZDsKPiAJc2hpZnQgPSBzaGlmdCAlIDg7CgogICAgICAgIHNoaWZ0ICU9IDg7
Cgo+IAo+IAlhc20gdm9sYXRpbGUoCj4gCQkiLm9wdGlvbiBwdXNoXG4iCj4gCQkiLm9wdGlvbiBh
cmNoLCt6YmJcbiIKPiAJCSJyb2x3ICUwLCAlMSwgJTJcbiIKPiAJCSIub3B0aW9uIHBvcFxuIgo+
IAkJOiAiPXIiICh3b3JkMzIpIDogInIiICh3b3JkMzIpLCAiciIgKHNoaWZ0KSA6KTsKPiAKPiAJ
cmV0dXJuICh1OCl3b3JkMzI7Cj4gCj4gbGVnYWN5Ogo+IAlyZXR1cm4gZ2VuZXJpY19yb2w4KHdv
cmQsIHNoaWZ0KTsKPiB9Cj4gCj4gc3RhdGljIGlubGluZSB1OCB2YXJpYWJsZV9yb3I4KHU4IHdv
cmQsIHVuc2lnbmVkIGludCBzaGlmdCkKPiB7Cj4gCXUzMiB3b3JkMzI7Cj4gCj4gCWFzbSBnb3Rv
KEFMVEVSTkFUSVZFKCJqICVsW2xlZ2FjeV0iLCAibm9wIiwgMCwKPiAJCQkJICAgICAgUklTQ1Zf
SVNBX0VYVF9aQkIsIDEpCj4gCQkJICA6IDogOiA6IGxlZ2FjeSk7Cj4gCj4gCXdvcmQzMiA9ICgo
dTMyKXdvcmQgPDwgOCkgfCB3b3JkOwo+IAlzaGlmdCA9IHNoaWZ0ICUgODsKPiAKPiAJYXNtIHZv
bGF0aWxlKAo+IAkJIi5vcHRpb24gcHVzaFxuIgo+IAkJIi5vcHRpb24gYXJjaCwremJiXG4iCj4g
CQkicm9ydyAlMCwgJTEsICUyXG4iCj4gCQkiLm9wdGlvbiBwb3BcbiIKPiAJCTogIj1yIiAod29y
ZDMyKSA6ICJyIiAod29yZDMyKSwgInIiIChzaGlmdCkgOik7Cj4gCj4gCXJldHVybiAodTgpd29y
ZDMyOwo+IAo+IGxlZ2FjeToKPiAJcmV0dXJuIGdlbmVyaWNfcm9yOCh3b3JkLCBzaGlmdCk7Cj4g
fQo+IGBgYAoKT0ssIHRoaXMgbG9va3MgYmV0dGVyLgoKPiBJIGNvbXBhcmVkIHRoZSBwZXJmb3Jt
YW5jZSBvZiByb3I4ICh6YmIgb3B0aW1pemVkKSBhbmQgZ2VuZXJpY19yb3I4IG9uIHRoZSBYVUFO
VElFIEM5MDgKPiBieSBsb29waW5nIHRoZW0uIHJvcjggaXMgYmV0dGVyLCBhbmQgdGhlIGFkdmFu
dGFnZSBvZiByb3I4IGJlY29tZXMgbW9yZSBvYnZpb3VzIGFzIHRoZQo+IG51bWJlciBvZiBpdGVy
YXRpb25zIGluY3JlYXNlcy4gVGhlIHRlc3QgY29kZSBpcyBhcyBmb2xsb3dzOgo+IGBgYAo+IAl1
OCB3b3JkID0gMHg1YTsKPiAJdTMyIHNoaWZ0ID0gOTsKPiAJdTMyIGksIGxvb3AgPSAxMDA7Cj4g
CXU4IHJldDEsIHJldDI7Cj4gCj4gCXU2NCB0MSA9IGt0aW1lX2dldF9ucygpOwo+IAlmb3IgKGkg
PSAwOyBpIDwgbG9vcDsgaSsrKSB7Cj4gCQlyZXQyID0gZ2VuZXJpY19yb3I4KHdvcmQsIHNoaWZ0
KTsKPiAJfQo+IAl1NjQgdDIgPSBrdGltZV9nZXRfbnMoKTsKPiAJZm9yIChpID0gMDsgaSA8IGxv
b3A7IGkrKykgewo+IAkJcmV0MSA9IHJvcjgod29yZCwgc2hpZnQpOwo+IAl9Cj4gCXU2NCB0MyA9
IGt0aW1lX2dldF9ucygpOwo+IAo+IAlwcl9pbmZvKCJ0Mi10MT0lbGxkIHQzLXQyPSVsbGRcbiIs
IHQyIC0gdDEsIHQzIC0gdDIpOwo+IGBgYAoKUGxlYXNlIGRvIHRoZSBmb2xsb3dpbmc6CgoxLiBE
cm9wIHRoZSBnZW5lcmljX3JvcjgoKSBhbmQga2VlcCBvbmx5IHJvci9sOCgpCjIuIEFkZCByb3Iv
bDE2LCAzNCBhbmQgNjQgdGVzdHMuCjMuIEFkanVzdCB0aGUgJ2xvb3AnIHNvIHRoYXQgZWFjaCBz
dWJ0ZXN0IHdpbGwgdGFrZSAxLTEwIG1zIG9uIHlvdXIgaHcuCjQuIE5hbWUgdGhlIGZ1bmN0aW9u
IGxpa2UgdGVzdF9yb3JsKCksIGFuZCBwdXQgaXQgbmV4dCB0byB0aGUgdGVzdF9mbnMoKQogICBp
biBsaWIvdGVzdF9iaXRvcHMuYy4gUmVmZXIgdGhlIDBhMmM2NjY0ZTU2ZjAgZm9yIGltcGxlbWVu
dGF0aW9uLgo1LiBQcmVwZW5kIHRoZSBzZXJpZXMgd2l0aCB0aGUgYmVuY2htYXJrIHBhdGNoLCBq
dXN0IGFzIHdpdGggY29uc3QtZXZhbAogICBvbmUsIGFuZCByZXBvcnQgYmVmb3JlL2FmdGVyIGZv
ciB5b3VyIHNlcmllcy4gCgo+ID4gUGxlYXNlIGZpbmQgYXR0YWNoZWQgYSB0ZXN0IGZvciBjb21w
aWxlLXRpbWUgcm9yL3JvbCBldmFsdWF0aW9uLgo+ID4gUGxlYXNlIGNvbnNpZGVyIHByZXBlbmRp
bmcgeW91ciBzZXJpZXMgd2l0aCBpdC4KPiAKPiBPa2F5LCBJJ2xsIGJyaW5nIGl0IHRvIHRoZSBu
ZXh0IHNlcmllcy4KClN0aWxsIHdhaXRpbmcgZm9yIGJsb2F0LW8tbWV0ZXIgcmVzdWx0cy4KClRo
YW5rcywKWXVyeQoKPiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWJpdG1h
bmlwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
