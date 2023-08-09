Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368B5C04A6A
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 03:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1IM6ebgnydJLRttJwc3UT83JaZetRBo2GQ4Gv7gzxNE=; b=eNxlXg5/gKI5wP
	m9Cm17NE6rbNryzqYOtLkdNRfmYW8wIUwRKaOUKpbJ8qEQmxdttUHXM9SNUGtuvQEJxaDQOU8nngf
	QMs7ODNKV+D3mIbaGQXDZbIHqqkc2iztYrBtO0Ex3AvMfw7cOJAeCt+83fqAbVGqUVQuymoKH8ef7
	VLH53wovbTsKZgDpB0zRXu3OTHXdO8joUMrbrWs+aN0M8iJBDclzip6pYwrMUwcUXR/nLzYs8BnLa
	qdjoV8pCbeplHEKFCqNG81cue7CtWuZqsP7P2mP/6uszkmtHR6VClL3mUjUApc0ZAGtM6Cp/HPVb8
	rbKlufX+WO3FPwcLqRUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTZqa-003wKr-2P;
	Wed, 09 Aug 2023 03:26:56 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTZqX-003wIe-1K;
	Wed, 09 Aug 2023 03:26:54 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b9f0b7af65so97551011fa.1;
        Tue, 08 Aug 2023 20:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691551609; x=1692156409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDtqmE5WaBwuWbcG5niee6vR0Dh8gvhaHzvoiNOQiws=;
        b=owAHMA78RpdKw7tQgsXJuS/elEyAp7vSGAzfHHJ5z4MmckA+NQrtCeJ+W8B7PUvc2D
         I/WpHW66G3aWUjJpuletY1j0z6aKy1xgec4upQFXMpwU9ycs+tCk/ePKYCi6Nbx+Tq5H
         Qy6MPyf/gtpxrwP1m2i9XoznQjE+jLj5ZwBSTijY/98bVmFXY24MFJCymc8ScA3Nxj2n
         fSOujTjvaaQVXxt/vcJYEAVtUVvyYiN2uWpHFHiII9KFwlpZWIDhDRw8t4Y/QmWWdq4T
         tB+UNi3v3GnHUI0r44M6p5HgP9APdJozCrZvNY2C87aDLO+gxiwTpgoEZWh+gs2IkgG7
         f6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691551609; x=1692156409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDtqmE5WaBwuWbcG5niee6vR0Dh8gvhaHzvoiNOQiws=;
        b=haax0fKuL9Ao0Bsd8Ppm2b/0SyFDDYNEEexXvyB23SGG2/szzwB/7q6q6jW0QIwH1s
         YpyXINQgpDOmj/kxix+bDdtJqUfS92UGtm/hjA02f6oV8VMrImQvVkj3b0txDenD39Mi
         8wV/lzsV8NYCDFV1t0ZlXsLnSuGKd8dPi3aQwTWKtfkltfcMkHmfiG41rUNcYp/IK+TD
         VGvidJy+tfS65IleJ6MElOPikS7z++IzDW9CpD8+p5qcrp2ZVyL44pn7Omv/NnANvhYD
         G+HbKmnY182UUoCDGtQqaWzdqG1GQJVaGPCYNHbV7ByXNCXx1WXCWvfo2DzIgbl+EQhJ
         MRWQ==
X-Gm-Message-State: AOJu0YxNxFPMVgJKtzpUE/Wc0KmhW7jCzxQ3WulWxSmcjLO2M6l1ZEMv
	W72b7SglKxoLS1jYE3hlGeqtFxyPVCk3mCgULP4=
X-Google-Smtp-Source: AGHT+IH2bKTSsX7/6xPrKfrQgho5P8O/hWC3nUT0gNKKQQAzMu/0fuX80th8S70Ytqj3VHXYwT6+ychP6EtQ0Fkfu08=
X-Received: by 2002:a2e:a16e:0:b0:2b5:9d78:213e with SMTP id
 u14-20020a2ea16e000000b002b59d78213emr935818ljl.22.1691551608635; Tue, 08 Aug
 2023 20:26:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690273969.git.haibo1.xu@intel.com> <CAAhSdy0yug=J0nxnnPoLYL=0MiT0w6qgPYOcv0QwMRe+fsQn8Q@mail.gmail.com>
 <87y1ilpz3m.wl-maz@kernel.org>
In-Reply-To: <87y1ilpz3m.wl-maz@kernel.org>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 9 Aug 2023 11:26:36 +0800
Message-ID: <CAJve8onZuOHkAUVY3=QeBPMx5n2F1fGgn57rPp7MB1Q5=vXasA@mail.gmail.com>
Subject: Re: [PATCH v6 00/13] RISCV: Add KVM_GET_REG_LIST API
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, oliver.upton@linux.dev, ajones@ventanamicro.com, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Shuah Khan <shuah@kernel.org>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Ricardo Koller <ricarkol@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Like Xu <likexu@tencent.com>, Vipin Sharma <vipinsh@google.com>, 
	David Matlack <dmatlack@google.com>, Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, 
	Haibo Xu <haibo1.xu@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_202653_470848_623012A4 
X-CRM114-Status: GOOD (  27.38  )
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

T24gVHVlLCBBdWcgOCwgMjAyMyBhdCA3OjEy4oCvUE0gTWFyYyBaeW5naWVyIDxtYXpAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIDA3IEF1ZyAyMDIzIDA0OjQ4OjMzICswMTAwLAo+IEFu
dXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+ID4KPiA+IEhpIE1hcmMsIEhp
IE9saXZlciwKPiA+Cj4gPiBPbiBUdWUsIEp1bCAyNSwgMjAyMyBhdCAyOjA14oCvUE0gSGFpYm8g
WHUgPGhhaWJvMS54dUBpbnRlbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBLVk1fR0VUX1JFR19M
SVNUIHdpbGwgZHVtcCBhbGwgcmVnaXN0ZXIgSURzIHRoYXQgYXJlIGF2YWlsYWJsZSB0bwo+ID4g
PiBLVk1fR0VUL1NFVF9PTkVfUkVHIGFuZCBJdCdzIHZlcnkgdXNlZnVsIHRvIGlkZW50aWZ5IHNv
bWUgcGxhdGZvcm0KPiA+ID4gcmVncmVzc2lvbiBpc3N1ZSBkdXJpbmcgVk0gbWlncmF0aW9uLgo+
ID4gPgo+ID4gPiBQYXRjaCAxLTcgcmUtc3RydWN0dXJlZCB0aGUgZ2V0LXJlZy1saXN0IHRlc3Qg
aW4gYWFyY2g2NCB0byBtYWtlIHNvbWUKPiA+ID4gb2YgdGhlIGNvZGUgYXMgY29tbW9uIHRlc3Qg
ZnJhbWV3b3JrIHRoYXQgY2FuIGJlIHNoYXJlZCBieSByaXNjdi4KPiA+ID4KPiA+ID4gUGF0Y2gg
OCBtb3ZlIHJlamVjdF9zZXQgY2hlY2sgbG9naWMgdG8gYSBmdW5jdGlvbiBzbyBhcyB0byBjaGVj
ayBmb3IKPiA+ID4gZGlmZmVyZW50IGVycm5vIGZvciBkaWZmZXJlbnQgcmVnaXN0ZXJzLgo+ID4g
PiBQYXRjaCA5IG1vdmUgZmluYWxpemVfdmNwdSBiYWNrIHRvIHJ1bl90ZXN0IHNvIHRoYXQgcmlz
Y3YgY2FuIGltcGxlbWVudAo+ID4gPiBpdHMgc3BlY2lmaWMgb3BlcmF0aW9uLgo+ID4gPiBQYXRj
aCAxMCBjaGFuZ2UgdG8gZG8gdGhlIGdldC9zZXQgb3BlcmF0aW9uIG9ubHkgb24gcHJlc2VudC1i
bGVzc2VkIGxpc3QuCj4gPiA+IFBhdGNoIDExIGFkZCB0aGUgc2tpcF9zZXQgZmFjaWxpdGllcyBz
byB0aGF0IHJpc2N2IGNhbiBza2lwIHNldCBvcGVyYXRpb24KPiA+ID4gb24gc29tZSByZWdpc3Rl
cnMuCj4gPiA+IFBhdGNoIDEyIGVuYWJsZWQgdGhlIEtWTV9HRVRfUkVHX0xJU1QgQVBJIGluIHJp
c2N2Lgo+ID4gPiBwYXRjaCAxMyBhZGRlZCB0aGUgY29ycmVzcG9uZGluZyBrc2VsZnRlc3QgZm9y
IGNoZWNraW5nIHBvc3NpYmxlCj4gPiA+IHJlZ2lzdGVyIHJlZ3Jlc3Npb25zLgo+ID4gPgo+ID4g
PiBUaGUgZ2V0LXJlZy1saXN0IGt2bSBzZWxmdGVzdCB3YXMgcG9ydGVkIGZyb20gYWFyY2g2NCBh
bmQgdGVzdGVkIHdpdGgKPiA+ID4gTGludXggdjYuNS1yYzMgb24gYSBRZW11IHJpc2N2NjQgdmly
dCBtYWNoaW5lLgo+ID4gPgo+ID4gPiAtLS0KPiA+ID4gQ2hhbmdlZCBzaW5jZSB2NToKPiA+ID4g
ICAqIFJlYmFzZSB0byB2Ni41LXJjMwo+ID4gPiAgICogTWlub3IgZml4IGZvciBBbmRyZXcncyBj
b21tZW50cwo+ID4gPgo+ID4gPiBBbmRyZXcgSm9uZXMgKDcpOgo+ID4gPiAgIEtWTTogYXJtNjQ6
IHNlbGZ0ZXN0czogUmVwbGFjZSBzdHJfd2l0aF9pbmRleCB3aXRoIHN0cmR1cF9wcmludGYKPiA+
ID4gICBLVk06IGFybTY0OiBzZWxmdGVzdHM6IERyb3AgU1ZFIGNhcCBjaGVjayBpbiBwcmludF9y
ZWcKPiA+ID4gICBLVk06IGFybTY0OiBzZWxmdGVzdHM6IFJlbW92ZSBwcmludF9yZWcncyBkZXBl
bmRlbmN5IG9uIHZjcHVfY29uZmlnCj4gPiA+ICAgS1ZNOiBhcm02NDogc2VsZnRlc3RzOiBSZW5h
bWUgdmNwdV9jb25maWcgYW5kIGFkZCB0byBrdm1fdXRpbC5oCj4gPiA+ICAgS1ZNOiBhcm02NDog
c2VsZnRlc3RzOiBEZWxldGUgY29yZV9yZWdfZml4dXAKPiA+ID4gICBLVk06IGFybTY0OiBzZWxm
dGVzdHM6IFNwbGl0IGdldC1yZWctbGlzdCB0ZXN0IGNvZGUKPiA+ID4gICBLVk06IGFybTY0OiBz
ZWxmdGVzdHM6IEZpbmlzaCBnZW5lcmFsaXppbmcgZ2V0LXJlZy1saXN0Cj4gPiA+Cj4gPiA+IEhh
aWJvIFh1ICg2KToKPiA+ID4gICBLVk06IGFybTY0OiBzZWxmdGVzdHM6IE1vdmUgcmVqZWN0X3Nl
dCBjaGVjayBsb2dpYyB0byBhIGZ1bmN0aW9uCj4gPiA+ICAgS1ZNOiBhcm02NDogc2VsZnRlc3Rz
OiBNb3ZlIGZpbmFsaXplX3ZjcHUgYmFjayB0byBydW5fdGVzdAo+ID4gPiAgIEtWTTogc2VsZnRl
c3RzOiBPbmx5IGRvIGdldC9zZXQgdGVzdHMgb24gcHJlc2VudCBibGVzc2VkIGxpc3QKPiA+ID4g
ICBLVk06IHNlbGZ0ZXN0czogQWRkIHNraXBfc2V0IGZhY2lsaXR5IHRvIGdldF9yZWdfbGlzdCB0
ZXN0Cj4gPiA+ICAgS1ZNOiByaXNjdjogQWRkIEtWTV9HRVRfUkVHX0xJU1QgQVBJIHN1cHBvcnQK
PiA+ID4gICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBnZXQtcmVnLWxpc3QgdGVzdAo+ID4K
PiA+IEFyZSB5b3Ugb2theSBmb3IgdGhpcyBzZXJpZXMgdG8gZ28gdGhyb3VnaCB0aGUgS1ZNIFJJ
U0MtViB0cmVlID8KPgo+IFN1cmUsIHNlZW1zIGZpbmUgZnJvbSBteSBwb2ludCBvZiB2aWV3LiBC
dXQgcGxlYXNlIHB1dCBpdCBvbiBhbgo+IGltbXV0YWJsZSB0b3BpYyBicmFuY2ggc28gdGhhdCB3
ZSBjYW4gYWxzbyBtZXJnZSBpdCBpbiB0aGUgYXJtNjQgdHJlZSwKPiBzaG91bGQgd2UgbmVlZCB0
byByZXNvbHZlIGFueSBjb25mbGljdHMuCj4KCkhpIE1hcmMsCgpUaGFua3MgZm9yIHlvdXIgcmV2
aWV3IQoKV2hpY2ggdG9waWMgYnJhbmNoIGRvIHlvdSBwcmVmZXIgb3Igc3VnZ2VzdCB0byB1c2U/
CkkgY2FuIGRvIGEgcmViYXNlIG9uIGl0IGFuZCBmaXggYW55IHBvdGVudGlhbCBjb25mbGljdHMu
CgpSZWdhcmRzLApIYWlibwoKPiBUaGFua3MsCj4KPiAgICAgICAgIE0uCj4KPiAtLQo+IFdpdGhv
dXQgZGV2aWF0aW9uIGZyb20gdGhlIG5vcm0sIHByb2dyZXNzIGlzIG5vdCBwb3NzaWJsZS4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
