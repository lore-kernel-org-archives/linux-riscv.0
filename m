Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD24CD128A
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Mar 2024 16:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xsF2PphZ7FXNOaSV16mTtmJ9Rr9oajRBotVySoOsYzo=; b=p6mhkuhS+BdIa5
	w8wfqkvfvM66yA5xTvbvPx4dUPfhDE9qtETF9cgLqfQq6U4Cy1emlQvYZ5vJibiINh1oaMPO9idVe
	d6ga1CKHkT+qyVto+v/wnqX7B/9ZWcJSCcWeQMJH9NYMiFj9Nsx8MH87xAa9j8cagPQ3INi+vnR0+
	oMrjvIsJnm2W+4ek/ohzsHR43+c+6JeCfDAyepkB8RJ/2O+S/xUzrDneQOi8zDvL4WSi6TeBV053i
	01f9Z7B75Kc6Qe6cNp6OXP6dMYztyFKJPTy3QVlEmAguHqzAOD5I+WC0sFNiTsZjTrOeDmg9byyKv
	iMkw7mHLSEGKNCmw0m6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqyGL-00000005nqa-0h6a;
	Sun, 31 Mar 2024 16:42:29 +0000
Received: from a.mx.secunet.com ([62.96.220.36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqyGB-00000005nlY-1kdy
	for linux-riscv@lists.infradead.org;
	Sun, 31 Mar 2024 16:42:26 +0000
Received: from localhost (localhost [127.0.0.1])
	by a.mx.secunet.com (Postfix) with ESMTP id 0A592208B8;
	Sun, 31 Mar 2024 18:42:18 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1GTR7-IKWqp2; Sun, 31 Mar 2024 18:42:16 +0200 (CEST)
Received: from mailout1.secunet.com (mailout1.secunet.com [62.96.220.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by a.mx.secunet.com (Postfix) with ESMTPS id BA512208BE;
	Sun, 31 Mar 2024 18:42:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com BA512208BE
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
	by mailout1.secunet.com (Postfix) with ESMTP id AC3AA80005E;
	Sun, 31 Mar 2024 18:42:14 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 18:42:14 +0200
Received: from Pickup by mbx-essen-01.secunet.de with Microsoft SMTP Server id
 15.1.2507.17; Sun, 31 Mar 2024 16:36:22 +0000
X-sender: <netdev+bounces-83498-steffen.klassert=secunet.com@vger.kernel.org>
X-Receiver: <steffen.klassert@secunet.com>
 ORCPT=rfc822;steffen.klassert@secunet.com NOTIFY=NEVER;
 X-ExtendedProps=BQAVABYAAgAAAAUAFAARAPDFCS25BAlDktII2g02frgPADUAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0LkRpcmVjdG9yeURhdGEuSXNSZXNvdXJjZQIAAAUAagAJAAEAAAAAAAAABQAWAAIAAAUAQwACAAAFAEYABwADAAAABQBHAAIAAAUAEgAPAGIAAAAvbz1zZWN1bmV0L291PUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChGWURJQk9IRjIzU1BETFQpL2NuPVJlY2lwaWVudHMvY249U3RlZmZlbiBLbGFzc2VydDY4YwUACwAXAL4AAACheZxkHSGBRqAcAp3ukbifQ049REI2LENOPURhdGFiYXNlcyxDTj1FeGNoYW5nZSBBZG1pbmlzdHJhdGl2ZSBHcm91cCAoRllESUJPSEYyM1NQRExUKSxDTj1BZG1pbmlzdHJhdGl2ZSBHcm91cHMsQ049c2VjdW5ldCxDTj1NaWNyb3NvZnQgRXhjaGFuZ2UsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1zZWN1bmV0LERDPWRlBQAOABEABiAS9uuMOkqzwmEZDvWNNQUAHQAPAAwAAABtYngtZXNzZW4tMDIFADwAAgAADwA2AAAATWljcm9zb2Z0LkV4Y2hhbmdlLlRyYW5zcG9ydC5NYWlsUmVjaXBpZW50LkRpc3BsYXlOYW1lDwARAAAAS2xhc3NlcnQsIFN0ZWZmZW4FAAwAAgAABQBsAAIAAAUAWAAXAEoAAADwxQktuQQJQ5LSCNoNNn64Q049S2xhc3NlcnQgU3RlZmZlbixPVT1Vc2VycyxPVT1NaWdyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUAJgACAAEFACIADwAxAAAAQXV0b1Jlc3BvbnNlU3VwcHJlc3M6IDANClRyYW5zbWl0SGlzdG9ye
	TogRmFsc2UNCg8ALwAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuRXhwYW5zaW9uR3JvdXBUeXBlDwAVAAAATWVtYmVyc0dyb3VwRXhwYW5zaW9uBQAjAAIAAQ==
X-CreatedBy: MSExchange15
X-HeloDomain: b.mx.secunet.com
X-ExtendedProps: BQBjAAoANommlidQ3AgFAGEACAABAAAABQA3AAIAAA8APAAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5Pcmdhbml6YXRpb25TY29wZREAAAAAAAAAAAAAAAAAAAAAAAUASQACAAEFAAQAFCABAAAAHAAAAHN0ZWZmZW4ua2xhc3NlcnRAc2VjdW5ldC5jb20FAAYAAgABBQApAAIAAQ8ACQAAAENJQXVkaXRlZAIAAQUAAgAHAAEAAAAFAAMABwAAAAAABQAFAAIAAQUAYgAKAE0AAADZigAABQBkAA8AAwAAAEh1Yg==
X-Source: SMTP:Default MBX-ESSEN-02
X-SourceIPAddress: 62.96.220.37
X-EndOfInjectedXHeaders: 19271
X-Virus-Scanned: by secunet
Received-SPF: Pass (sender SPF authorized) identity=mailfrom; client-ip=147.75.199.223; helo=ny.mirrors.kernel.org; envelope-from=netdev+bounces-83498-steffen.klassert=secunet.com@vger.kernel.org; receiver=steffen.klassert@secunet.com 
DKIM-Filter: OpenDKIM Filter v2.11.0 b.mx.secunet.com 2859C2025D
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711793594; cv=none; b=bSJi2sR1AN1OJJT5964TyV+iw0AFoXsFfcNNQzQqBfdurhLo6QPOMhi4QDleME/EAEI3zHec8PyMZn2F58yTv/H2wmack6HF78DqL1FnpNS6bise3Nd9D6Y7+YaQ1kyzJwXEhdAWb4jEXr53P0FqSLruQ5QTK9CGDubbLQkdGm8=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711793594; c=relaxed/simple;
	bh=JsC5VoUeo6qxef9ZMkY4tQtQ3yej/gi/YLd2vJTrgK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hxarvLPRu+mk5ZdBc2p/IGRm2QUk0IROp6ZHdAtn1SLD5lufjD0LhzsDPh/tuPb5K0x5d0iwDRGKuSSkl9UjDJXD7+aG7B/m6uxajIuQmS7pVL+sDSBm5s94QtStuFDAFs9VG6lT4jV6WI5g+zDbCu92cB5/V3c/P4+nz0Ltgew=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Message-ID: <52117f9c-b691-409f-ad2a-a25f53a9433d@huaweicloud.com>
Date: Sat, 30 Mar 2024 18:12:57 +0800
Precedence: bulk
X-Mailing-List: netdev@vger.kernel.org
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 0/5] Support local vmtest for riscv64
To: Eduard Zingerman <eddyz87@gmail.com>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>
CC: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	<andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
	<song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
	<sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Manu Bretelle <chantr4@gmail.com>, Pu Lehui
	<pulehui@huawei.com>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
 <32b3358903bf8ba408812a2636f39a275493eb91.camel@gmail.com>
 <e995a1f1-0b48-4ce3-a061-5cbe68beb6dd@huaweicloud.com>
 <f91237f311f183d57c4620bc2e6099df8aefccb0.camel@gmail.com>
Content-Language: en-US
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <f91237f311f183d57c4620bc2e6099df8aefccb0.camel@gmail.com>
X-CM-TRANSID: cCh0CgBnggup5QdmbcobIg--.18079S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWryDWry5tFy7Gw4xAFy3XFb_yoWrXw4Dpw
	4xGrnFyrW0qF1fKrn7CFyUuF42gr18G347AryrGrWakwn7JFWktFnaka4Yq39Fga90q39I
	yaySv343C3WUCa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
	AIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv
	6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUFDGOUUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_094220_179926_E47D8949 
X-CRM114-Status: GOOD (  23.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20240330101257._LgpcvSdDD2HxhNX527Zi53-yoblBTi4XCxr2wIwp0Y@z>


On 2024/3/30 3:46, Eduard Zingerman wrote:
> On Fri, 2024-03-29 at 18:10 +0800, Pu Lehui wrote:
> [...]
> 
>>> Apparently jammy does not have binaries built for riscv64, or I'm failing to find correct mirror.
>>> Could you please provide some instructions on how to prepare rootfs?
>>
>> Hi Eduard, We need the mirror repository of ubuntu-ports, you could try
>> http://de.ports.ubuntu.com/.
> 
> Hi Pu, thank you this mirrorm it works.
> 
> Unfortunately my local setup is still not good enough.
> I've installed cross-riscv64-gcc14 but it seems that a few more
> libraries are necessary, as I get the following compilation errors: >
>    $ PLATFORM=riscv64 CROSS_COMPILE=riscv64-suse-linux- ./vmtest.sh -- ./test_verifier
>    ... kernel compiles ok ...
>    ../../../../scripts/sign-file.c:25:10: fatal error: openssl/opensslv.h: No such file or directory
>       25 | #include <openssl/opensslv.h>
>          |          ^~~~~~~~~~~~~~~~~~~~
>    compilation terminated.
>      CC      /home/eddy/work/bpf-next/tools/testing/selftests/bpf/tools/build/host/libbpf/sharedobjs/bpf.o
>    In file included from nlattr.c:14:
>    libbpf_internal.h:19:10: fatal error: libelf.h: No such file or directory
>       19 | #include <libelf.h>
>    ...
> 
> Looks like I won't be able to test this patch-set, unless you have
> some writeup on how to create a riscv64 dev environment at hand.
> Sorry for the noise

Yeah, environmental issues are indeed a developer's nightmare. I will 
try to do something for the newcomers of riscv64 bpf. At present, I have 
simply built a docker local vmtest environment [0] based on Bjorn's 
riscv-cross-builder. We can directly run vmtest within this environment. 
Hopefully it will help.

Link: https://github.com/pulehui/riscv-cross-builder/tree/vmtest [0]

PS: Since the current rootfs of riscv64 is not in the INDEX, I simply 
modified vmtest.sh to support local rootfs. And we can use it by:
```
PLATFORM=riscv64 CROSS_COMPILE=riscv64-linux-gnu- \
     tools/testing/selftests/bpf/vmtest.sh -l /rootfs -- \
         ./test_progs -d \
             \"$(cat tools/testing/selftests/bpf/DENYLIST.riscv64 \
                 | cut -d'#' -f1 \
                 | sed -e 's/^[[:space:]]*//' \
                       -e 's/[[:space:]]*$//' \
                 | tr -s '\n' ','\
             )\"
```

diff --git a/tools/testing/selftests/bpf/vmtest.sh 
b/tools/testing/selftests/bpf/vmtest.sh
index f6889de9b498..17aff708c416 100755
--- a/tools/testing/selftests/bpf/vmtest.sh
+++ b/tools/testing/selftests/bpf/vmtest.sh
@@ -148,6 +148,21 @@ download_rootfs()
  		zstd -d | sudo tar -C "$dir" -x
  }

+load_rootfs()
+{
+	local image_dir="$1"
+	local rootfsversion="$2"
+	local dir="$3"
+
+	if ! which zstd &> /dev/null; then
+		echo 'Could not find "zstd" on the system, please install zstd'
+		exit 1
+	fi
+
+	cat "${image_dir}/libbpf-vmtest-rootfs-$rootfsversion.tar.zst" |
+		zstd -d | sudo tar -C "$dir" -x
+}
+
  recompile_kernel()
  {
  	local kernel_checkout="$1"
@@ -234,6 +249,7 @@ EOF

  create_vm_image()
  {
+	local local_image_dir="$1"
  	local rootfs_img="${OUTPUT_DIR}/${ROOTFS_IMAGE}"
  	local mount_dir="${OUTPUT_DIR}/${MOUNT_DIR}"

@@ -245,7 +261,11 @@ create_vm_image()
  	mkfs.ext4 -q "${rootfs_img}"

  	mount_image
-	download_rootfs "$(newest_rootfs_version)" "${mount_dir}"
+	if [[ "${local_image_dir}" == "" ]]; then
+		download_rootfs "$(newest_rootfs_version)" "${mount_dir}"
+	else
+		load_rootfs "${local_image_dir}" "$(newest_rootfs_version)" 
"${mount_dir}"
+	fi
  	unmount_image
  }

@@ -363,12 +383,16 @@ main()
  	local update_image="no"
  	local exit_command="poweroff -f"
  	local debug_shell="no"
+	local local_image_dir=""

-	while getopts ':hskid:j:' opt; do
+	while getopts ':hskil:d:j:' opt; do
  		case ${opt} in
  		i)
  			update_image="yes"
  			;;
+		l)
+			local_image_dir="$OPTARG"
+			;;
  		d)
  			OUTPUT_DIR="$OPTARG"
  			;;
@@ -445,7 +469,7 @@ main()
  	fi

  	if [[ "${update_image}" == "yes" ]]; then
-		create_vm_image
+		create_vm_image "${local_image_dir}"
  	fi

  	update_selftests "${kernel_checkout}" "${make_command}"


X-sender: <netdev+bounces-83498-peter.schumann=secunet.com@vger.kernel.org>
X-Receiver: <peter.schumann@secunet.com> ORCPT=rfc822;peter.schumann@secunet.com NOTIFY=NEVER; X-ExtendedProps=BQAVABYAAgAAAAUAFAARAJ05ab4WgQhHsqdZ7WUjHykPADUAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0LkRpcmVjdG9yeURhdGEuSXNSZXNvdXJjZQIAAAUAagAJAAEAAAAAAAAABQAWAAIAAAUAQwACAAAFAEYABwADAAAABQBHAAIAAAUAEgAPAGAAAAAvbz1zZWN1bmV0L291PUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChGWURJQk9IRjIzU1BETFQpL2NuPVJlY2lwaWVudHMvY249UGV0ZXIgU2NodW1hbm41ZTcFAAsAFwC+AAAAQ5IZ35DtBUiRVnd98bETxENOPURCNCxDTj1EYXRhYmFzZXMsQ049RXhjaGFuZ2UgQWRtaW5pc3RyYXRpdmUgR3JvdXAgKEZZRElCT0hGMjNTUERMVCksQ049QWRtaW5pc3RyYXRpdmUgR3JvdXBzLENOPXNlY3VuZXQsQ049TWljcm9zb2Z0IEV4Y2hhbmdlLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUADgARAC7JU/le071Fhs0mWv1VtVsFAB0ADwAMAAAAbWJ4LWVzc2VuLTAxBQA8AAIAAA8ANgAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5EaXNwbGF5TmFtZQ8ADwAAAFNjaHVtYW5uLCBQZXRlcgUADAACAAAFAGwAAgAABQBYABcASAAAAJ05ab4WgQhHsqdZ7WUjHylDTj1TY2h1bWFubiBQZXRlcixPVT1Vc2VycyxPVT1NaWdyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUAJgACAAEFACIADwAxAAAAQXV0b1Jlc3BvbnNlU3VwcHJlc3M6IDANClRyYW5zbWl0SGlzdG9yeTogRmFsc2UNCg8ALwAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuRXhwYW5zaW9uR3JvdXBUeXBlDwAVAAAATWVtYmVyc0dyb3VwRXhwYW5zaW9uBQAjAAIAAQ==
X-CreatedBy: MSExchange15
X-HeloDomain: b.mx.secunet.com
X-ExtendedProps: BQBjAAoAU4mmlidQ3AgFAGEACAABAAAABQA3AAIAAA8APAAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5Pcmdhbml6YXRpb25TY29wZREAAAAAAAAAAAAAAAAAAAAAAAUASQACAAEFAAQAFCABAAAAGgAAAHBldGVyLnNjaHVtYW5uQHNlY3VuZXQuY29tBQAGAAIAAQUAKQACAAEPAAkAAABDSUF1ZGl0ZWQCAAEFAAIABwABAAAABQADAAcAAAAAAAUABQACAAEFAGIACgBOAAAA2YoAAAUAZAAPAAMAAABIdWI=
X-Source: SMTP:Default MBX-ESSEN-02
X-SourceIPAddress: 62.96.220.37
X-EndOfInjectedXHeaders: 19236
Received: from cas-essen-02.secunet.de (10.53.40.202) by
 mbx-essen-02.secunet.de (10.53.40.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Sat, 30 Mar 2024 11:13:28 +0100
Received: from b.mx.secunet.com (62.96.220.37) by cas-essen-02.secunet.de
 (10.53.40.202) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Sat, 30 Mar 2024 11:13:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by b.mx.secunet.com (Postfix) with ESMTP id 54A632025D
	for <peter.schumann@secunet.com>; Sat, 30 Mar 2024 11:13:28 +0100 (CET)
X-Virus-Scanned: by secunet
X-Spam-Flag: NO
X-Spam-Score: -2.651
X-Spam-Level:
X-Spam-Status: No, score=-2.651 tagged_above=-999 required=2.1
	tests=[BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	MAILING_LIST_MULTI=-1, RCVD_IN_DNSWL_NONE=-0.0001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=unavailable autolearn_force=no
Received: from b.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IcouR_g5ZRpo for <peter.schumann@secunet.com>;
	Sat, 30 Mar 2024 11:13:25 +0100 (CET)
Received-SPF: Pass (sender SPF authorized) identity=mailfrom; client-ip=147.75.48.161; helo=sy.mirrors.kernel.org; envelope-from=netdev+bounces-83498-peter.schumann=secunet.com@vger.kernel.org; receiver=peter.schumann@secunet.com 
DKIM-Filter: OpenDKIM Filter v2.11.0 b.mx.secunet.com 85E3620315
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by b.mx.secunet.com (Postfix) with ESMTPS id 85E3620315
	for <peter.schumann@secunet.com>; Sat, 30 Mar 2024 11:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96F24B2240E
	for <peter.schumann@secunet.com>; Sat, 30 Mar 2024 10:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADDC82838E;
	Sat, 30 Mar 2024 10:13:14 +0000 (UTC)
X-Original-To: netdev@vger.kernel.org
Received: from dggsgout12.his.huawei.com (unknown [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64FAB67F;
	Sat, 30 Mar 2024 10:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711793594; cv=none; b=bSJi2sR1AN1OJJT5964TyV+iw0AFoXsFfcNNQzQqBfdurhLo6QPOMhi4QDleME/EAEI3zHec8PyMZn2F58yTv/H2wmack6HF78DqL1FnpNS6bise3Nd9D6Y7+YaQ1kyzJwXEhdAWb4jEXr53P0FqSLruQ5QTK9CGDubbLQkdGm8=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711793594; c=relaxed/simple;
	bh=JsC5VoUeo6qxef9ZMkY4tQtQ3yej/gi/YLd2vJTrgK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hxarvLPRu+mk5ZdBc2p/IGRm2QUk0IROp6ZHdAtn1SLD5lufjD0LhzsDPh/tuPb5K0x5d0iwDRGKuSSkl9UjDJXD7+aG7B/m6uxajIuQmS7pVL+sDSBm5s94QtStuFDAFs9VG6lT4jV6WI5g+zDbCu92cB5/V3c/P4+nz0Ltgew=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4V6ClD2Vwgz4f3js9;
	Sat, 30 Mar 2024 18:12:56 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id AD8D11A0175;
	Sat, 30 Mar 2024 18:13:02 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP1 (Coremail) with SMTP id cCh0CgBnggup5QdmbcobIg--.18079S2;
	Sat, 30 Mar 2024 18:12:59 +0800 (CST)
Message-ID: <52117f9c-b691-409f-ad2a-a25f53a9433d@huaweicloud.com>
Date: Sat, 30 Mar 2024 18:12:57 +0800
Precedence: bulk
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 0/5] Support local vmtest for riscv64
To: Eduard Zingerman <eddyz87@gmail.com>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>
CC: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	<andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
	<song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
	<sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Manu Bretelle <chantr4@gmail.com>, Pu Lehui
	<pulehui@huawei.com>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
 <32b3358903bf8ba408812a2636f39a275493eb91.camel@gmail.com>
 <e995a1f1-0b48-4ce3-a061-5cbe68beb6dd@huaweicloud.com>
 <f91237f311f183d57c4620bc2e6099df8aefccb0.camel@gmail.com>
Content-Language: en-US
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <f91237f311f183d57c4620bc2e6099df8aefccb0.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: cCh0CgBnggup5QdmbcobIg--.18079S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWryDWry5tFy7Gw4xAFy3XFb_yoWrXw4Dpw
	4xGrnFyrW0qF1fKrn7CFyUuF42gr18G347AryrGrWakwn7JFWktFnaka4Yq39Fga90q39I
	yaySv343C3WUCa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
	AIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv
	6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUFDGOUUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
Return-Path: netdev+bounces-83498-peter.schumann=secunet.com@vger.kernel.org
X-MS-Exchange-Organization-OriginalArrivalTime: 30 Mar 2024 10:13:28.3828
 (UTC)
X-MS-Exchange-Organization-Network-Message-Id: 7ed3d682-bc21-43ab-4d07-08dc50a20b46
X-MS-Exchange-Organization-OriginalClientIPAddress: 62.96.220.37
X-MS-Exchange-Organization-OriginalServerIPAddress: 10.53.40.202
X-MS-Exchange-Organization-Cross-Premises-Headers-Processed: cas-essen-02.secunet.de
X-MS-Exchange-Organization-OrderedPrecisionLatencyInProgress: LSRV=mbx-essen-02.secunet.de:TOTAL-HUB=0.426|SMR=0.353(SMRDE=0.004|SMRC=0.348(SMRCL=0.101|X-SMRCR=0.347))|CAT=0.071(CATRESL=0.014
 (CATRESLP2R=0.002)|CATORES=0.048(CATRS=0.048(CATRS-Transport Rule
 Agent=0.001|CATRS-Index Routing Agent=0.046
 ))|CATORT=0.004(CATRT=0.004(CATRT-Journal
 Agent=0.003)));2024-03-30T10:13:28.842Z
X-MS-Exchange-Forest-ArrivalHubServer: mbx-essen-02.secunet.de
X-MS-Exchange-Organization-AuthSource: cas-essen-02.secunet.de
X-MS-Exchange-Organization-AuthAs: Anonymous
X-MS-Exchange-Organization-FromEntityHeader: Internet
X-MS-Exchange-Organization-OriginalSize: 11920
X-MS-Exchange-Organization-HygienePolicy: Standard
X-MS-Exchange-Organization-MessageLatency: SRV=cas-essen-02.secunet.de:TOTAL-FE=0.034|SMR=0.008(SMRPI=0.006(SMRPI-FrontendProxyAgent=0.006))|SMS=0.025
X-MS-Exchange-Organization-Recipient-Limit-Verified: True
X-MS-Exchange-Organization-TotalRecipientCount: 1
X-MS-Exchange-Organization-Rules-Execution-History: 0b0cf904-14ac-4724-8bdf-482ee6223cf2%%%fd34672d-751c-45ae-a963-ed177fcabe23%%%d8080257-b0c3-47b4-b0db-23bc0c8ddb3c%%%95e591a2-5d7d-4afa-b1d0-7573d6c0a5d9%%%f7d0f6bc-4dcc-4876-8c5d-b3d6ddbb3d55%%%16355082-c50b-4214-9c7d-d39575f9f79b
X-MS-Exchange-Forest-RulesExecuted: mbx-essen-02
X-MS-Exchange-Organization-RulesExecuted: mbx-essen-02
X-MS-Exchange-Forest-IndexAgent-0: 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
 aEmaV3XAE5nmiAB5HdvMWo3c62N85mRS3EqLSjARwHXVINhYnjByPU
 tVQEhX02IV9NMvFDJ51dSpd1Qkr2+TLIxrKMGnKFKlknIXpi3kp7VK
 0+5Keeom9NT1cVI4NCcSzBjXNIb6eNKQZugWM22lQKdoSQOo0kwEJg
 L4TPG5qAZRRg2o0sTOUrr5eXoe0do0fj9xIG7idsIghsO2FlAII7ab
 ixiSIUpfWUpBUAZLyzTEvpwo3FcT6xn8AdGVHDEzr8dvemQQjAkI/w
 NdfC2YnRoAAAECngQ8P3htbCB2ZXJzaW9uPSIxLjAiIGVuY29kaW5n
 PSJ1dGYtMTYiPz4NCjxUYXNrU2V0Pg0KICA8VmVyc2lvbj4xNS4wLj
 AuMDwvVmVyc2lvbj4NCiAgPFRhc2tzPg0KICAgIDxUYXNrIFN0YXJ0
 SW5kZXg9IjIxNSI+DQogICAgICA8VGFza1N0cmluZz4mZ3Q7Jmd0Oy
 ZndDsgQ291bGQgeW91IHBsZWFzZSBwcm92aWRlIHNvbWUgaW5zdHJ1
 Y3Rpb25zIG9uIGhvdyB0byBwcmVwYXJlIHJvb3Rmcz88L1Rhc2tTdH
 Jpbmc+DQogICAgICA8QXNzaWduZWVzPg0KICAgICAgICA8RW1haWxV
 c2VyIElkPSJlZGR5ejg3QGdtYWlsLmNvbSI+RWR1YXJkIFppbmdlcm
 1hbjwvRW1haWxVc2VyPg0KICAgICAgICA8RW1haWxVc2VyIElkPSJi
 cGZAdmdlci5rZXJuZWwub3JnIiAvPg0KICAgICAgICA8RW1haWxVc2
 VyIElkPSJsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnIiAv
 Pg0KICAgICAgICA8RW1haWxVc2VyIElkPSJuZXRkZXZAdmdlci5rZX
 JuZWwub3JnIiAvPg0KICAgICAgPC9Bc3NpZ25lZXM+DQogICAgPC9U
 YXNrPg0KICA8L1Rhc2tzPg0KPC9UYXNrU2V0PgELxgM8P3htbCB2ZX
 JzaW9uPSIxLjAiIGVuY29kaW5nPSJ1dGYtMTYiPz4NCjxVcmxTZXQ+
 DQogIDxWZXJzaW9uPjE1LjAuMC4wPC9WZXJzaW9uPg0KICA8VXJscz
 4NCiAgICA8VXJsIFN0YXJ0SW5kZXg9IjM3MiIgVHlwZT0iVXJsIj4N
 CiAgICAgIDxVcmxTdHJpbmc+aHR0cDovL2RlLnBvcnRzLnVidW50dS
 5jb20vPC9VcmxTdHJpbmc+DQogICAgPC9Vcmw+DQogICAgPFVybCBT
 dGFydEluZGV4PSIxNzU2IiBUeXBlPSJVcmwiPg0KICAgICAgPFVybF
 N0cmluZz5odHRwczovL2dpdGh1Yi5jb20vcHVsZWh1aS9yaXNjdi1j
 cm9zcy1idWlsZGVyL3RyZWUvdm10ZXN0PC9VcmxTdHJpbmc+DQogIC
 AgPC9Vcmw+DQogICAgPFVybCBTdGFydEluZGV4PSIxOTAyIiBUeXBl
 PSJVcmwiPg0KICAgICAgPFVybFN0cmluZz52bXRlc3Quc2g8L1VybF
 N0cmluZz4NCiAgICA8L1VybD4NCiAgPC9VcmxzPg0KPC9VcmxTZXQ+
 AQ7PAVJldHJpZXZlck9wZXJhdG9yLDEwLDE7UmV0cmlldmVyT3Blcm
 F0b3IsMTEsMztQb3N0RG9jUGFyc2VyT3BlcmF0b3IsMTAsMTtQb3N0
 RG9jUGFyc2VyT3BlcmF0b3IsMTEsMDtQb3N0V29yZEJyZWFrZXJEaW
 Fnbm9zdGljT3BlcmF0b3IsMTAsNTtQb3N0V29yZEJyZWFrZXJEaWFn
 bm9zdGljT3BlcmF0b3IsMTEsMDtUcmFuc3BvcnRXcml0ZXJQcm9kdW NlciwyMCwyMQ==
X-MS-Exchange-Forest-IndexAgent: 1 4099
X-MS-Exchange-Forest-EmailMessageHash: 051C196B
X-MS-Exchange-Forest-Language: en
X-MS-Exchange-Organization-Processed-By-Journaling: Journal Agent


On 2024/3/30 3:46, Eduard Zingerman wrote:
> On Fri, 2024-03-29 at 18:10 +0800, Pu Lehui wrote:
> [...]
> 
>>> Apparently jammy does not have binaries built for riscv64, or I'm failing to find correct mirror.
>>> Could you please provide some instructions on how to prepare rootfs?
>>
>> Hi Eduard, We need the mirror repository of ubuntu-ports, you could try
>> http://de.ports.ubuntu.com/.
> 
> Hi Pu, thank you this mirrorm it works.
> 
> Unfortunately my local setup is still not good enough.
> I've installed cross-riscv64-gcc14 but it seems that a few more
> libraries are necessary, as I get the following compilation errors: >
>    $ PLATFORM=riscv64 CROSS_COMPILE=riscv64-suse-linux- ./vmtest.sh -- ./test_verifier
>    ... kernel compiles ok ...
>    ../../../../scripts/sign-file.c:25:10: fatal error: openssl/opensslv.h: No such file or directory
>       25 | #include <openssl/opensslv.h>
>          |          ^~~~~~~~~~~~~~~~~~~~
>    compilation terminated.
>      CC      /home/eddy/work/bpf-next/tools/testing/selftests/bpf/tools/build/host/libbpf/sharedobjs/bpf.o
>    In file included from nlattr.c:14:
>    libbpf_internal.h:19:10: fatal error: libelf.h: No such file or directory
>       19 | #include <libelf.h>
>    ...
> 
> Looks like I won't be able to test this patch-set, unless you have
> some writeup on how to create a riscv64 dev environment at hand.
> Sorry for the noise

Yeah, environmental issues are indeed a developer's nightmare. I will 
try to do something for the newcomers of riscv64 bpf. At present, I have 
simply built a docker local vmtest environment [0] based on Bjorn's 
riscv-cross-builder. We can directly run vmtest within this environment. 
Hopefully it will help.

Link: https://github.com/pulehui/riscv-cross-builder/tree/vmtest [0]

PS: Since the current rootfs of riscv64 is not in the INDEX, I simply 
modified vmtest.sh to support local rootfs. And we can use it by:
```
PLATFORM=riscv64 CROSS_COMPILE=riscv64-linux-gnu- \
     tools/testing/selftests/bpf/vmtest.sh -l /rootfs -- \
         ./test_progs -d \
             \"$(cat tools/testing/selftests/bpf/DENYLIST.riscv64 \
                 | cut -d'#' -f1 \
                 | sed -e 's/^[[:space:]]*//' \
                       -e 's/[[:space:]]*$//' \
                 | tr -s '\n' ','\
             )\"
```

diff --git a/tools/testing/selftests/bpf/vmtest.sh 
b/tools/testing/selftests/bpf/vmtest.sh
index f6889de9b498..17aff708c416 100755
--- a/tools/testing/selftests/bpf/vmtest.sh
+++ b/tools/testing/selftests/bpf/vmtest.sh
@@ -148,6 +148,21 @@ download_rootfs()
  		zstd -d | sudo tar -C "$dir" -x
  }

+load_rootfs()
+{
+	local image_dir="$1"
+	local rootfsversion="$2"
+	local dir="$3"
+
+	if ! which zstd &> /dev/null; then
+		echo 'Could not find "zstd" on the system, please install zstd'
+		exit 1
+	fi
+
+	cat "${image_dir}/libbpf-vmtest-rootfs-$rootfsversion.tar.zst" |
+		zstd -d | sudo tar -C "$dir" -x
+}
+
  recompile_kernel()
  {
  	local kernel_checkout="$1"
@@ -234,6 +249,7 @@ EOF

  create_vm_image()
  {
+	local local_image_dir="$1"
  	local rootfs_img="${OUTPUT_DIR}/${ROOTFS_IMAGE}"
  	local mount_dir="${OUTPUT_DIR}/${MOUNT_DIR}"

@@ -245,7 +261,11 @@ create_vm_image()
  	mkfs.ext4 -q "${rootfs_img}"

  	mount_image
-	download_rootfs "$(newest_rootfs_version)" "${mount_dir}"
+	if [[ "${local_image_dir}" == "" ]]; then
+		download_rootfs "$(newest_rootfs_version)" "${mount_dir}"
+	else
+		load_rootfs "${local_image_dir}" "$(newest_rootfs_version)" 
"${mount_dir}"
+	fi
  	unmount_image
  }

@@ -363,12 +383,16 @@ main()
  	local update_image="no"
  	local exit_command="poweroff -f"
  	local debug_shell="no"
+	local local_image_dir=""

-	while getopts ':hskid:j:' opt; do
+	while getopts ':hskil:d:j:' opt; do
  		case ${opt} in
  		i)
  			update_image="yes"
  			;;
+		l)
+			local_image_dir="$OPTARG"
+			;;
  		d)
  			OUTPUT_DIR="$OPTARG"
  			;;
@@ -445,7 +469,7 @@ main()
  	fi

  	if [[ "${update_image}" == "yes" ]]; then
-		create_vm_image
+		create_vm_image "${local_image_dir}"
  	fi

  	update_selftests "${kernel_checkout}" "${make_command}"



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
