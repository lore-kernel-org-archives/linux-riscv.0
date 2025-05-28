Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A01C5AD49
	for <linux-riscv@archiver.kernel.org>; Wed, 28 May 2025 16:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z25gn7cUFnKbf+YBda4GT/Wlkh51TBQ4/pUFJNO1v+c=; b=ZrbC+YhphqhCh8
	UVbua1wl6Nm4MaRE6HH8kJ4caIAZS4L+16AlyY4wejYqtUTog1uCWnfk9A/OE/1W2KoGpGYyJfTNx
	izo+5JvTq/gKoa0mbdZAyPN7ENZCpFmFTp+pc6AWkQTLa08rdNccL/Qne3aYT2dJj/hfub/cCSdWi
	CJX4boTPBVJSp8dond1zpWPENX3aTErY/BJGPukX4vHVMAPuO3xFsIUIxE5+VHd7tLzx7fCjJ3FmM
	/zLokZ5zxo9YJbQxnzc+m0zqVAVpNkSv8ZsDi3W44utHaxgLV6+z95TAZlhCOb2/6egHUsGpDWWo1
	COgbVcQblCtAdodTCubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJeR-0000000Dgay-2DeI;
	Wed, 28 May 2025 16:29:11 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJTP-0000000DdYp-3kLz
	for linux-riscv@lists.infradead.org;
	Wed, 28 May 2025 16:17:49 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e740a09eae0so3775798276.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 May 2025 09:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748449066; x=1749053866; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTzSLuw5Tgn9PujxmjAjgP7UtvlX2ja/Zjw4kSQsqdg=;
        b=AejspqcKRyWtNFwGiqb1Fc+cU2y3MyF27ClKGgnFoER3M/mA+et41ZN/eiHZdzm5hl
         3A4tJ2LLM7rfswE0yRQvOf4r1EHKzVzUVCdyufpsb6oGYRMj/iHacPK1ZR9Jkcj/0E+f
         ldW6pcoMig8ib+jKvth7jFrIbbpPNqVm/aGrF0qC1jA/gjYFeAfUcoOlW1dlElbOg0TK
         Z4xsHY1hL6Ub8ed0w175QFlit5BEBOKD970e2ts0v7c5HFEfy4u3dKpCKiBTQ1xF7DWb
         XBCUyU1Dg6Te2d2B9FHSOyBxEVpT8UpDhQjfubPh/eSDnrwYdw39gqFifruz+q9lc7W+
         4SQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748449066; x=1749053866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTzSLuw5Tgn9PujxmjAjgP7UtvlX2ja/Zjw4kSQsqdg=;
        b=f+1CmByMmxfVKHXl6itify1InfK89VaxEcXcUdxMTK3bvs9EhfVTj+n3K8UIj2mZTa
         uIcoE5pXT6JP9KVuFktnS+LNAPyeb3/kco3snseqLCNPL46j2jBE5MdJhNy5EiROpDi6
         KddqR0bqYmZh0j6vary+AnBD7DWE4ititrdx41JH3nyXQBu0YFA8+MgbDo2mJ718fwpO
         d5YNkB5fHmt01DKoX2IGgO8DBv8KodkTteVM34Hrymi8TOfaJs33WdDnj5lqdJvu/l4j
         Cr1g3T4rhx3afc9AOGQJj0/vZZ2UvhMlxAJJXrcUclRZ08nPrYqlnfyljQW8UsMB+6RZ
         0OhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL6JwwP6EES7jVlFRJwDOK+f5XeN/FSig3ZPdIlWuxSDNLM9DiCw8nIYml7erkddPhLEXAfEPTwY17nw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm5Ba3/hPSIqAiimiT+EJMuD5YE4KsFO/6gQ336ZXm3l3kICZ8
	o9s3/7wpBz5i5AlgbrtYuN7EzFx3BWpuiDJluC+EMAZIOZbf/F3UnwS93jUfU+Jh8Jq4ceYA9nP
	Dn1NeINge+WgjIWIZd7inBerqTH+SNHBeAw==
X-Gm-Gg: ASbGnctfM8r7Zb7PPeUGf80ZQO1BqUvxkHiMdAej40SbQ4I7jDxK5rpOJjViBLFAeBr
	19d98JgVFkzjf1OEkjIwO3HWMpygPeHL/JnURXIwDqtCYBKC+vE3Yrk/Iz2knoG5mQTQEyiC1Uv
	/UjySMBMncNyVV+xgBqtx+isSBIbAEPgw=
X-Google-Smtp-Source: AGHT+IFF/umILiMgGZDGCLbJ5sT/qzWVOHlqk/6oUs0GExo2HD46i9Ov/em8Cdr+A78lOfG7WV8hw5tz0sQQvQ//DcA=
X-Received: by 2002:a17:90b:3ec6:b0:2fe:b774:3ec8 with SMTP id
 98e67ed59e1d1-3110f332a9cmr20114781a91.23.1748449055876; Wed, 28 May 2025
 09:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250522160954.429333-1-cyrilbur@tenstorrent.com> <2c07d65e-0641-42a0-9eb4-9e42d9325ff2@ghiti.fr>
In-Reply-To: <2c07d65e-0641-42a0-9eb4-9e42d9325ff2@ghiti.fr>
From: Andy Chiu <andybnac@gmail.com>
Date: Thu, 29 May 2025 00:17:24 +0800
X-Gm-Features: AX0GCFt9_AqO8_XbUCelsbyxCoWk63hdmjOhaTlGWY4wVu0fiMlfSByuwGx24k0
Message-ID: <CAFTtA3PATS2CT-jax7eTNS=ZqU55CwGr=TeGiNX16ztfp5v9_w@mail.gmail.com>
Subject: Re: [PATCH] riscv: uaccess: Only restore the CSR_STATUS SUM bit
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Cyril Bur <cyrilbur@tenstorrent.com>, samuel.holland@sifive.com, 
	ben.dooks@codethink.co.uk, palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	jszhang@kernel.org, paul.walmsley@sifive.com, charlie@rivosinc.com, 
	jrtc27@jrtc27.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	Deepak Gupta <debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_091747_932283_366A201C 
X-CRM114-Status: GOOD (  23.40  )
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

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgNDozOeKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBn
aGl0aS5mcj4gd3JvdGU6Cj4KPiArY2MgbGludXgtcmlzY3YsIEFuZHksIERlZXBhawo+Cj4gT24g
NS8yMi8yNSAxODowOSwgQ3lyaWwgQnVyIHdyb3RlOgo+ID4gRHVyaW5nIHN3aXRjaCB0byBjc3Jz
IHdpbGwgT1IgdGhlIHZhbHVlIG9mIHRoZSByZWdpc3RlciBpbnRvIHRoZQo+ID4gY29ycmVzcG9u
ZGluZyBjc3IuIEluIHRoaXMgY2FzZSB3ZSdyZSBvbmx5IGludGVyZXN0ZWQgaW4gcmVzdG9yaW5n
IHRoZQo+ID4gU1VNIGJpdCBub3QgdGhlIGVudGlyZSByZWdpc3Rlci4KPiA+Cj4gPiBGaXhlczog
Nzg4YWE2NGMwICgicmlzY3Y6IHNhdmUgdGhlIFNSX1NVTSBzdGF0dXMgb3ZlciBzd2l0Y2hlcyIp
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDeXJpbCBCdXIgPGN5cmlsYnVyQHRlbnN0b3JyZW50LmNvbT4K
PiA+IC0tLQo+ID4gSSd2ZSBwdXQgdGhlIEZpeGVzIHRhZyBpbiBidXQgSSBhc3N1bWUgdGhpcyB3
aWxsIGdldCBzcXVhc2hlZCBpbnRvIHRoZQo+ID4gcGF0Y2guIEVpdGhlciB3YXkgSSBob3BlIHRo
aXMgd29ya3MgdG8gZml4IHRoZSBpbW1lZGlhdGUgaXNzdWUuCj4gPgo+ID4gICBhcmNoL3Jpc2N2
L2tlcm5lbC9lbnRyeS5TIHwgMTIgKysrKysrKystLS0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL2VudHJ5LlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4gPiBpbmRl
eCAwMGJkMGRlOWZhYTIuLjZlZDNiZDgwOTAzZCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL2VudHJ5LlMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPiA+IEBA
IC0zOTksMTQgKzM5OSwxOCBAQCBTWU1fRlVOQ19TVEFSVChfX3N3aXRjaF90bykKPiA+ICAgICAg
IFJFR19TIHMxMSwgVEFTS19USFJFQURfUzExX1JBKGEzKQo+ID4KPiA+ICAgICAgIC8qIHNhdmUg
dGhlIHVzZXIgc3BhY2UgYWNjZXNzIGZsYWcgKi8KPiA+IC0gICAgIGxpICAgIHMwLCBTUl9TVU0K
PiA+IC0gICAgIGNzcnIgIHMxLCBDU1JfU1RBVFVTCj4gPiAtICAgICBSRUdfUyBzMSwgVEFTS19U
SFJFQURfU1RBVFVTX1JBKGEzKQo+ID4gKyAgICAgY3NyciAgczAsIENTUl9TVEFUVVMKPiA+ICsg
ICAgIFJFR19TIHMwLCBUQVNLX1RIUkVBRF9TVEFUVVNfUkEoYTMpCj4gPgo+ID4gICAgICAgLyog
U2F2ZSB0aGUga2VybmVsIHNoYWRvdyBjYWxsIHN0YWNrIHBvaW50ZXIgKi8KPiA+ICAgICAgIHNj
c19zYXZlX2N1cnJlbnQKPiA+IC0gICAgIC8qIFJlc3RvcmUgY29udGV4dCBmcm9tIG5leHQtPnRo
cmVhZCAqLwo+ID4gKyAgICAgLyoKPiA+ICsgICAgICAqIFJlc3RvcmUgY29udGV4dCBmcm9tIG5l
eHQtPnRocmVhZC4gY3NycyB3aWxsIE9SIHRoZSBiaXRzIGZyb20gczAgYW5kCj4gPiArICAgICAg
KiBvbmx5IHdhbnQgdG8gcmVzdG9yZSB0aGUgU1JfU1VNIGJpdAo+ID4gKyAgICAgICovCj4gPiAg
ICAgICBSRUdfTCBzMCwgIFRBU0tfVEhSRUFEX1NUQVRVU19SQShhNCkKPiA+ICsgICAgIGxpICAg
IHMxLCAgU1JfU1VNCj4gPiArICAgICBhbmQgICBzMCwgIHMwLCBzMQo+ID4gICAgICAgY3NycyAg
Q1NSX1NUQVRVUywgczAKPiA+ICAgICAgIFJFR19MIHJhLCAgVEFTS19USFJFQURfUkFfUkEoYTQp
Cj4gPiAgICAgICBSRUdfTCBzcCwgIFRBU0tfVEhSRUFEX1NQX1JBKGE0KQo+Cj4gVG8gY29uY2x1
ZGUgdGhlIGRpc2N1c3Npb24gd2UgaGFkIGhlcmUKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1yaXNjdi9hREN0QVRsMk4yMWZCc3lUQGRlYnVnLmJhLnJpdm9zaW5jLmNvbS8jdCwKPiBp
biBhZGRpdGlvbiB0byBDeXJpbCdzIHBhdGNoIGFib3ZlLCB0byBtZSB3ZSBvbmx5IGhhdmUgdG8g
cmVuYW1lIHRoZQo+IHN0YXR1cyBmaWVsZCBpbnRvIHN1bSBhbmQgd2UncmUgZ29vZCB0byBnby4g
QEFuZHksIEBEZWVwYWsgQFNhbXVlbCBEbwo+IHlvdSBhZ3JlZT8KCkxHVE0sIHRoYW5rcyEKCkFu
ZHkKCj4KPiBBcyB0aGlzIGlzIGFuIGltcG9ydGFudCBmaXggKGFsb25nIHdpdGggMiBvdGhlciBm
aXhlcywgb25lIGZvciB0aGVhZAo+IHZlY3RvciBhbmQgdmRzbyBzdGF0aWMgdmFsdWVzKSwgSSdk
IGxpa2UgdG8gc2VuZCBhbm90aGVyIFBSIHNvb24gZm9yCj4gaW5jbHVzaW9uIGluIDYuMTYtcmMx
LCBJIGRpZCBub3Qgd2FudCB0byBkZWxheSB0aGUgc2Vjb25kIFBSIGFueSBsb25nZXIuCj4KPiBU
aGFua3MgZm9yIHlvdXIgZmVlZGJhY2tzLAo+Cj4gQWxleAo+Cj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
