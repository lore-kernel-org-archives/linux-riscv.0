Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA271C7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 10:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VfU5DNDpW8BNZnMTYM7N58vrhTP+HqvtsXslz7Wx7N8=; b=CTuCVuzQYpv6I+
	rjdyO5ZoiFluee3lr3+H9rbT7WSDcQ4Iu2bCb84uLaXXCXYsgCMPuY3E8AclMU/vwOl0/C7YPRDxX
	t3IKVBsQ4WGNYXLlqKUZLV/gwag1n782QbxeRF8kaO1JtpiHHvvg7Gl7Evd0JdsJUdDmgWgzK6pcD
	WOeIpteIX/o1NIOqgSaR2l/b7XT8TtZlXxBm3INPO2mI6t47adaIMjzs9GXO5Sy//G++GbBOoWn3W
	1zBKt/qsFpkXT7hQRulsPk6EJ9VGIDW7QeGsZnh3XeAk547UxZPafAueljexd09sewphHl5lycffJ
	BNKd+fzt4TGztG1TSTxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwgup-005kFt-0E;
	Wed, 10 May 2023 10:19:23 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwgum-005kFO-0p
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 10:19:21 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-52c30fbccd4so6379148a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 May 2023 03:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683713958; x=1686305958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6TzFaeCtsMyNHK5TeH92zz3hB8ciuzOv3glPd5m6k7I=;
        b=eNSMyA+YCxWztneHcmukaT6xLcQ5dhXTjeJ22Z4Xi9+ur68aJtIRfqtcCJ//xaoRwY
         1eLdkqWNRgI50/CW131HJI7Q2VbMxOHANI9AplmX3a0L9ULkG5pq3RCah0piqw4x49TX
         Cx28bKfGFVRUU0f35kS0UH4jd9k8wbT5ZCY5JZEs66GfrVLp2OAByBne4AjCxZ+TaO7i
         4wiW19mEF4pw6Q7dQfUqy4+TAbMEkb7/2dbeIwVrhSeD87HcF5j4DYWmu0Cjvk9hU/by
         G150n2etnUnAoLmlPWZbhU/Q8aEjIZciXVUPN42e0wVp0aqzIHQAHL7pkbylJXD6zIY+
         Lrow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683713958; x=1686305958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6TzFaeCtsMyNHK5TeH92zz3hB8ciuzOv3glPd5m6k7I=;
        b=VZYrukIxEypcwJidaFm4I+GEXWOrT32+pVCTIyHbxfhAGgC0al6abrG/1SPesmG2Am
         4Elb5/3n4UYBBVMBfX3k/cc/teJyd+kczfRENI3DwaiGTbG9aWEbAo9fEYlBw+d5MqVn
         h20Nx/zD+oSCaV3u320E8+NNtkdoA8NkUfZUymVZp7SMmkHwLe7erMyR1Plitg7VePlL
         qKu2fPwhVBHUnzJsu5F1MX8auF3o4xl0GfLQY8jR0mEB7fFd4bdMsI4nVv/WtRAIoU5S
         dRRyUYuIJAmdk0zuLeBDztWqP1pTFfIMHDEXgv6otX8aVVeGhfT9QAbq7aNQodHpify+
         eVSg==
X-Gm-Message-State: AC+VfDxpLTFjSooTmWyaQh2VVVk3LLTNDkK9EqnZhwpKg5UifUsl8WAr
	HVH58XkNyeKHEXwCswL8jIU=
X-Google-Smtp-Source: ACHHUZ6tDzveM5eOKzKrGk213LFBmv5V4FVEwtFB/+ed+zvaz7MwM+K1L7Xavv4Vhy/NAiw+g+hCmA==
X-Received: by 2002:a17:903:185:b0:1a1:e237:5f0 with SMTP id z5-20020a170903018500b001a1e23705f0mr22428195plg.58.1683713957671;
        Wed, 10 May 2023 03:19:17 -0700 (PDT)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id p16-20020a170902e75000b001aadd0d7364sm3393419plf.83.2023.05.10.03.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 03:19:17 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	guoren@kernel.org,
	suagrfillet@gmail.com,
	jszhang@kernel.org,
	e.shatokhin@yadro.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH V9 0/4] riscv: Optimize function trace
Date: Wed, 10 May 2023 18:18:53 +0800
Message-Id: <20230510101857.2953955-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_031920_311289_01485766 
X-CRM114-Status: GOOD (  16.43  )
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

Q2hhbmdlcyBpbiB2OToKCjEuIGFkZCBBY2tlZC1ieSBmcm9tIEJqw7ZybiBUw7ZwZWwgaW4gcGF0
Y2ggMQoKMi4gcmViYXNlIHBhdGNoMi9wYXRjaDMgb24gTGludXggdjYuNC1yYzEKCiAgLSBwYXRj
aCAyOiB0byBtYWtlIHRoZSBgU0FWRV9BQklfUkVHU2AgY29uZmlndXJhYmxlLCByZXZlcnQgdGhl
CiAgICBtb2RpZmljYXRpb24gb2YgbWNvdW50LWR5bi5TIGZyb20gY29tbWl0ICg0NWIzMmI5NDZh
OTcgInJpc2N2OgplbnRyeTogQ29uc29saWRhdGUgZ2VuZXJhbCByZWdzIHNhdmluZy9yZXN0b3Jp
bmciKQoKICAtIHBhdGNoIDM6IHRvIHBhc3MgdGhlIHRyYWNlX3NlbGZ0ZXN0LCBhZGQgdGhlIGlt
cGxlbWVudCBvZgogICAgYGZ0cmFjZV9zdHViX2RpcmVjdF90cmFtcGAgZnJvbSBjb21taXQgKGZl
ZTg2YTRlZDUzNiAiZnRyYWNlOgpzZWxmdGVzdDogcmVtb3ZlIGJyb2tlbiB0cmFjZV9kaXJlY3Rf
dHJhbXAiKSA7IGFuZCBmaXh1cCB0aGUgY29udGV4dApjb25mbGljdCBpbiBLY29uZmlnIAoKWW91
IGNhbiBkaXJlY3RseSB0cnkgaXQgd2l0aDoKCmh0dHBzOi8vZ2l0aHViLmNvbS9zdWdhcmZpbGxl
dC9saW51eC90cmVlLzYuNC1yYzEtcnYtZnRyYWNlLXY5CgoKVGhpcyBzZXJpZXMgb3B0aW1pemVz
IGZ1bmN0aW9uIHRyYWNlLiBUaGUgZmlyc3QgMyBpbmRlcGVuZGVudCAKcGF0Y2hlcyBoYXMgYmVl
biBwaWNrZWQgaW4gdGhlIFY3IHZlcnNpb24gb2YgdGhpcyBzZXJpZXMsIHRoZQpzdWJzZXF1ZW50
IHZlcnNpb24gY29udGludWVzIHRoZSBmb2xsb3dpbmcgNCBwYXRjaGVzOgoKc2VsZWN0IEZUUkFD
RV9NQ09VTlRfVVNFX1BBVENIQUJMRV9GVU5DVElPTl9FTlRSWSBbMV0gKHBhdGNoIDEpCj09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KCklu
IFJJU0MtViwgLWZwYXRjaGFibGUtZnVuY3Rpb24tZW50cnkgb3B0aW9uIGlzIHVzZWQgdG8gc3Vw
cG9ydApkeW5hbWljIGZ0cmFjZSBpbiB0aGlzIGNvbW1pdCBhZmM3NmI4YjgwMTEgKCJyaXNjdjog
VXNpbmcKUEFUQ0hBQkxFX0ZVTkNUSU9OX0VOVFJZIGluc3RlYWQgb2YgTUNPVU5UIikuIFNvIHJl
Y29yZG1jb3VudApkb24ndCBoYXZlIHRvIGJlIGNhbGxlZCB0byBjcmVhdGUgdGhlIF9fbWNvdW50
X2xvYyBzZWN0aW9uIGJlZm9yZQp0aGUgdm1saW51eCBsaW5raW5nLgoKSGVyZSBzZWxlY3RzIEZU
UkFDRV9NQ09VTlRfVVNFX1BBVENIQUJMRV9GVU5DVElPTl9FTlRSWSB0byB0ZWxsCk1ha2VmaWxl
IG5vdCB0byBydW4gcmVjb3JkbWNvdW50LgoKTWFrZSBmdW5jdGlvbiBncmFwaCB1c2UgZnRyYWNl
IGRpcmVjdGx5IFsyXSAocGF0Y2ggMikKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0gCgpJbiBSSVNDLVYgYXJjaGl0ZWN0dXJlLCB3aGVuIHdl
IGVuYWJsZSB0aGUgZnRyYWNlX2dyYXBoIHRyYWNlciBvbiBzb21lCmZ1bmN0aW9ucywgdGhlIGZ1
bmN0aW9uIHRyYWNpbmdzIG9uIG90aGVyIGZ1bmN0aW9ucyB3aWxsIHN1ZmZlciBleHRyYQpncmFw
aCB0cmFjaW5nIHdvcmsuIEluIGVzc2VuY2UsIGdyYXBoX29wcyBpc24ndCBsaW1pdGVkIGJ5IGl0
cyBmdW5jX2hhc2gKZHVlIHRvIHRoZSBnbG9iYWwgZnRyYWNlX2dyYXBoX1tyZWdzXV9jYWxsIGxh
YmVsLiBUaGF0IHNob3VsZCBiZQpjb3JyZWN0ZWQuCgpXaGF0IGluc3BpcmVzIG1lIGlzIHRoZSBj
b21taXQgMGMwNTkzYjQ1YzliICgieDg2L2Z0cmFjZTogTWFrZSBmdW5jdGlvbgpncmFwaCB1c2Ug
ZnRyYWNlIGRpcmVjdGx5IikgdGhhdCB1c2VzIGdyYXBoX29wczo6ZnVuYyBmdW5jdGlvbiB0bwpp
bnN0YWxsIHJldHVybl9ob29rZXIgYW5kIG1ha2VzIHRoZSBmdW5jdGlvbiBjYWxsZWQgYWdhaW5z
dCBpdHMKZnVuY19oYXNoLgoKQWRkIFdJVEhfRElSRUNUX0NBTExTIHN1cHBvcnQgWzNdIChwYXRj
aCAzLCA0KQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpU
aGlzIHNlcmllcyBhZGRzIERZTkFNSUNfRlRSQUNFX1dJVEhfRElSRUNUX0NBTExTIHN1cHBvcnQg
Zm9yIFJJU0MtVi4KU0FNUExFX0ZUUkFDRV9ESVJFQ1QgYW5kIFNBTVBMRV9GVFJBQ0VfRElSRUNU
X01VTFRJIGFyZSBhbHNvIGluY2x1ZGVkCmhlcmUgYXMgdGhlIHNhbXBsZXMgZm9yIHRlc3Rpbmcg
RElSRUNUX0NBTExTIHJlbGF0ZWQgaW50ZXJmYWNlLgoKRmlyc3QsIHNlbGVjdCB0aGUgRFlOQU1J
Q19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMgdG8gcHJvdmlkZSAKcmVnaXN0ZXJfZnRyYWNlX2Rp
cmVjdFtfbXVsdGldIGludGVyZmFjZXMgYWxsb3dpbmcgdXNlciB0byByZWdpc3RlciAKdGhlIGN1
c3RvbWVkIHRyYW1wb2xpbmUgKGRpcmVjdF9jYWxsZXIpIGFzIHRoZSBtY291bnQgZm9yIG9uZSBv
ciAKbW9yZSB0YXJnZXQgZnVuY3Rpb25zLiBBbmQgbW9kaWZ5X2Z0cmFjZV9kaXJlY3RbX211bHRp
XSBhcmUgYWxzbyAKcHJvdmlkZWQgZm9yIG1vZGlmeSBkaXJlY3RfY2FsbGVyLgoKQXQgdGhlIHNh
bWUgdGltZSwgdGhlIHNhbXBsZXMgaW4gLi9zYW1wbGVzL2Z0cmFjZS8gY2FuIGJlIGJ1aWx0CmFz
IGtlcmVubCBtb2R1bGUgZm9yIHRlc3RpbmcgdGhlc2UgaW50ZXJmYWNlcyB3aXRoIFNBTVBMRV9G
VFJBQ0VfRElSRUNUCmFuZCBTQU1QTEVfRlRSQUNFX0RJUkVDVF9NVUxUSSBzZWxlY3RlZC4KClNl
Y29uZCwgdG8gbWFrZSB0aGUgZGlyZWN0X2NhbGxlciBhbmQgdGhlIG90aGVyIGZ0cmFjZSBob29r
cwooZWcuIGZ1bmN0aW9uL2ZncmFwaCB0cmFjZXIsIGtbcmV0XXByb2JlcykgY28tZXhpc3QsIGEg
dGVtcG9yYXJ5CnJlZ2lzdGVyCmFyZSBub21pbmF0ZWQgdG8gc3RvcmUgdGhlIGFkZHJlc3Mgb2Yg
ZGlyZWN0X2NhbGxlciBpbgpmdHJhY2VfcmVnc19jYWxsZXIuCkFmdGVyIHRoZSBzZXR0aW5nIG9m
IHRoZSBhZGRyZXNzIGRpcmVjdF9jYWxsZXIgYnkgZGlyZWN0X29wcy0+ZnVuYyBhbmQKdGhlIFJF
U1RPUkVfUkVHUyBpbiBmdHJhY2VfcmVnc19jYWxsZXIsIGRpcmVjdF9jYWxsZXIgd2lsbCBiZSBq
dW1wZWQgdG8KYnkgdGhlIGBqcmAgaW5zdC4KClRoZSBzZXJpZXMncyBvbGQgY2hhbmdlcyByZWxh
dGVkIHRoZXNlIHBhdGNoZXMKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09CgpDaGFuZ2VzIGluIHY4OgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8y
MDIzMDMyNDAzMzM0Mi4zMTc3OTc5LTEtc3VhZ3JmaWxsZXRAZ21haWwuY29tLwogLSBGaXggaW5j
b3JyZWN0IGFkZHJlc3MgdmFsdWVzIGluIHRoZSA0bmQgcGF0Y2ggCiAtIFJlYmFzZWQgb24gdjYu
My1yYzIKCkNoYW5nZXMgaW4gdjc6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2
LzIwMjMwMTEyMDkwNjAzLjEyOTUzNDAtMS1ndW9yZW5Aa2VybmVsLm9yZy8KIC0gRml4dXAgUkVT
VE9SRV9BQklfUkVHUyBieSByZW1vdmUgUFRfVDAoc3ApIG92ZXJ3cml0ZS4KIC0gQWRkIEZUUkFD
RV9NQ09VTlRfVVNFX1BBVENIQUJMRV9GVU5DVElPTl9FTlRSWSBbMV0KIC0gRml4dXAga2NvbmZp
ZyB3aXRoIEhBVkVfU0FNUExFX0ZUUkFDRV9ESVJFQ1QgJgogICBIQVZFX1NBTVBMRV9GVFJBQ0Vf
RElSRUNUX01VTFRJCgpDaGFuZ2VzIGluIHY2OgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1yaXNjdi8yMDIzMDEwNzEzMzU0OS40MTkyNjM5LTEtZ3VvcmVuQGtlcm5lbC5vcmcvCiAtIFJl
cGxhY2UgOCB3aXRoIE1DT1VOVF9JTlNOX1NJWkUKIC0gUmVwbGFjZSAiUkVHX0wgYTEsIFBUX1JB
KHNwKSIgd2l0aCAibXYgYTEsIHJhIgogLSBBZGQgRXZnZW5paSBTaGF0b2toaW4gY29tbWVudAoK
Q2hhbmdlcyBpbiB2NToKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMjEy
MDgwOTEyNDQuMjAzNDA3LTEtZ3VvcmVuQGtlcm5lbC5vcmcvCiAtIFNvcnQgS2NvbmZpZyBlbnRy
aWVzIGluIGFscGhhYmV0aWNhbCBvcmRlci4KCkNoYW5nZXMgaW4gdjQ6Cmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjIxMTI5MDMzMjMwLjI1NTk0Ny0xLWd1b3JlbkBrZXJu
ZWwub3JnLwogLSBJbmNsdWRlIFszXSBmb3IgbWFpbnRlbmFuY2UuIFtTb25nIFNodWFpXQoKQ2hh
bmdlcyBpbiBWMzoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMjExMjMx
NTM5NTAuMjkxMTk4MS0xLWd1b3JlbkBrZXJuZWwub3JnLwogLSBJbmNsdWRlIFsyXSBmb3IgbWFp
bnRlbmFuY2UuIFtTb25nIFNodWFpXQoKWzFdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1yaXNjdi9DQUFZczI9ajNFYWs5dlU2eGJBdzB6UHVvaDAwcmg4djVDMlUzZmVQa29rWkZpYldz
MmdAbWFpbC5nbWFpbC5jb20vVC8jdApbMl06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwv
MjAyMjExMjAwODQyMzAuOTEwMTUyLTEtc3VhZ3JmaWxsZXRAZ21haWwuY29tLwpbM106IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjIxMTIzMTQyMDI1LjE1MDQwMzAtMS1z
dWFncmZpbGxldEBnbWFpbC5jb20vIAoKU29uZyBTaHVhaSAoNCk6CiAgcmlzY3Y6IHNlbGVjdCBG
VFJBQ0VfTUNPVU5UX1VTRV9QQVRDSEFCTEVfRlVOQ1RJT05fRU5UUlkKICByaXNjdjogZnRyYWNl
OiBBZGQgZnRyYWNlX2dyYXBoX2Z1bmMKICByaXNjdjogZnRyYWNlOiBBZGQgRFlOQU1JQ19GVFJB
Q0VfV0lUSF9ESVJFQ1RfQ0FMTFMgc3VwcG9ydAogIHNhbXBsZXM6IGZ0cmFjZTogQWRkIHJpc2N2
IHN1cHBvcnQgZm9yIFNBTVBMRV9GVFJBQ0VfRElSRUNUW19NVUxUSV0KCiBhcmNoL3Jpc2N2L0tj
b25maWcgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA0ICsKIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vZnRyYWNlLmggICAgICAgICAgICAgfCAgMTkgKystCiBhcmNoL3Jpc2N2L2tlcm5lbC9m
dHJhY2UuYyAgICAgICAgICAgICAgICAgIHwgIDMwICsrLS0KIGFyY2gvcmlzY3Yva2VybmVsL21j
b3VudC1keW4uUyAgICAgICAgICAgICAgfCAxNzYgKysrKysrKysrKysrKysrKystLS0KIHNhbXBs
ZXMvZnRyYWNlL2Z0cmFjZS1kaXJlY3QtbW9kaWZ5LmMgICAgICAgfCAgMzMgKysrKwogc2FtcGxl
cy9mdHJhY2UvZnRyYWNlLWRpcmVjdC1tdWx0aS1tb2RpZnkuYyB8ICAzOSArKysrKwogc2FtcGxl
cy9mdHJhY2UvZnRyYWNlLWRpcmVjdC1tdWx0aS5jICAgICAgICB8ICAyMyArKysKIHNhbXBsZXMv
ZnRyYWNlL2Z0cmFjZS1kaXJlY3QtdG9vLmMgICAgICAgICAgfCAgMjYgKysrCiBzYW1wbGVzL2Z0
cmFjZS9mdHJhY2UtZGlyZWN0LmMgICAgICAgICAgICAgIHwgIDIyICsrKwogOSBmaWxlcyBjaGFu
Z2VkLCAzMjggaW5zZXJ0aW9ucygrKSwgNDQgZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
